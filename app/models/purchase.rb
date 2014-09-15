#require 'money/bank/google_currency'

class Purchase < ActiveRecord::Base
  belongs_to :user
  has_many :purchase_items, :dependent => :destroy

  after_save :trigger_zip_creation

  scope :completed, where(:completed => true)
  scope :uncompleted, where(:completed => false)

  def self.old
    where('created_at < ?', 7.days.ago)
  end

  def self.update_exchange_rates!
    #Money.default_bank = Money::Bank::GoogleCurrency.new
  end

  def update_price!
    sum = purchase_items.map(&:price).inject(&:+)
    self.price = sum || Money.new(0)

    save
  end

  #composed_of :price,
  #  :class_name => "Money",
  #  :mapping => [%w(price_in_cents cents), %w(currency currency_as_string)],
  #  :constructor => Proc.new { |cents, currency| Money.new(cents || 0, currency || Money.default_currency) }
  #
  def trigger_zip_creation
    if completed?
      purchase_items.each do |purchase_item| 
        song = purchase_item.song
        Resque.enqueue(CreateMultitrackZipFile, song.id) if !song.multitrack_zip_file?
      end
    end
  end

  def send_invoice
    if completed? && user
      InvoiceMailer.invoice(id).deliver
    end
  end

  def complete!
    return if completed?
    update_attribute(:completed, true)
    send_invoice
  end

  def uncomplete!
    update_attribute(:completed, false)
  end

  def self.create_from_cart(cart, user, currency)
    purchase = Purchase.create(:user => user, :currency => currency)
    cart.items.each do |item|
      purchase.purchase_items.create(:song => item.item, :format => item.format)
    end
    purchase
  end

  def self.revenue_last(time)
    revenue = completed.where('created_at > ?', DateTime.now - time).all.sum(&:price)
    if revenue == 0
      revenue = '0 EUR'.to_money
    end
    revenue
  end

  def vat
    price * 0.20
  end
end
