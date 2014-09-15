class User < ActiveRecord::Base

  #acts_as_followable
  #acts_as_follower

  # http://wiki.github.com/ryanb/cancan/role-based-authorization
  # ROLES = %w{admin}

  #belongs_to :record_label
  #belongs_to :user_type
  #has_one :bank_transfer_information
  #belongs_to :manager, :class_name => 'User'
  #
  #has_many :songs
  #has_many :tracks
  #belongs_to :picture
  #has_many :purchases
  #has_many :purchase_items, :through => :purchases
  #has_many :adyen_notifications
  #has_many :authentications, :dependent => :destroy
  #has_many :dismissed_timeline_events
  #has_many :pending_social_network_messages
  #has_many :down_payments
  #has_many :banners
  #has_many :managed_artists, :class_name => 'User', :foreign_key => 'manager_id'
  #has_many :agents
  #
  #has_one :owned_record_label, :class_name => "RecordLabel", :foreign_key => "admin_id"
  #
  ##devise :database_authenticatable, :recoverable, :rememberable, :trackable
  #
  #validates_presence_of :email, :if => :email_required?
  #validates_format_of :email, :with => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i, :allow_blank => true
  #validates_presence_of :name
  #
  #def email_required?
  #  manager.blank?
  #end
  #
  ##attr_accessible :email, :password, :password_confirmation, :name, :picture_id, :user_type_id, :record_label_id, :description, :website, :bank_transfer_information_attributes, :remember_me, :terms_accepted, :emails_accepted, :featured, :role, :twitter_username
  #accepts_nested_attributes_for :bank_transfer_information
  #
  ## validates_acceptance_of :terms_accepted, :accept => true, :allow_nil => false, :on => :create
  #
  #scope :starting_with, lambda { |*args| { :conditions => ["users.name like ?", args.first + '%'] } }
  #scope :alphabetical, order(:name)
  #
  ##has_friendly_id :name, :use_slug => true, :approximate_ascii => true
  #
  ##define_index do
  ##  indexes :name
  ##  indexes :description
  ##end
  #
  #before_save :add_picture
  #
  #def original_songs
  #  songs.original
  #end
  #
  #def remixes
  #  songs.remix.reject(&:project?)
  #end
  #
  #def projects
  #  songs.remix.select(&:project?)
  #end
  #
  #def self.artists
  #  scoped & UserType.musicians_and_bands
  #end
  #
  #def self.front_page_filter
  #  scoped
  #end
  #
  #def purchased_songs
  #  Song.joins(:purchase_items => :purchase) & PurchaseItem.scoped & Purchase.completed.where(:user_id => id)
  #end
  #
  #def self.random
  #  # The condition on created_at is to prevent query caching
  #  where(:created_at.lt => Time.now.utc).order('rand()')
  #end
  #
  #def self.featured
  #  where(:featured => true).random
  #end
  #
  #def self.with_picture
  #  self.includes(:picture) & Picture.with_attachment
  #end
  #
  #def picture?
  #  picture && picture.picture?
  #end
  #
  #def admin?
  #  role == 'admin'
  #end
  #
  #def add_picture 
  #  self.picture = Picture.create if !picture
  #end
  #
  #def bought_multitracks
  #  Song.scoped & (PurchaseItem.multitracks & (Purchase.completed.where(:user => self)))
  #end
  #
  #def bought_songs
  #  Song.scoped & (PurchaseItem.scoped & (Purchase.completed.where(:user => self)))
  #end
  #
  #def bought_song?(song)
  #  bought_songs.include?(song)
  #end
  #
  #scope :connections, lambda { |user| 
  #  joins(:follows).where('(follows.follower_id = ? OR follows.followable_id = ?) AND follows.follower_type = ?', user.id, user.id, User.to_s)
  #}
  #
  #def connections
  #  User.connections(self)
  #end
  #
  ## def self.new_with_session(params, session)
  ##   super.tap do |user|
  ##     if omniauth_info = session['devise.omniauth_info']
  ##       user.name  = omniauth_info[:name]  if user.name.blank?
  ##       user.email = omniauth_info[:email] if user.email.blank?
  ##       if !user.picture
  ##         image_url = omniauth_info[:image]
  ##         if image_url
  ##           image_url.gsub!(/_normal/, '')
  ##           user.picture = Picture.create(:external_url => image_url)
  ##         end
  ##       end
  ##     end
  ##   end
  ## end
  #
  #def update_token(omniauth)
  #  token = authentications.find_or_initialize_by_provider(omniauth[:provider])
  #  token.update_attributes(:uid => omniauth[:uid], :credentials => omniauth[:credentials])
  #end
  #
  #def connected_to_facebook?
  #  authentications.facebook.present?
  #end
  #
  #def connected_to_twitter?
  #  authentications.twitter.present?
  #end
  #
  ## def connected_to_myspace?
  ##   authentications.myspace.present?
  ## end
  #
  #def facebook_accounts
  #  unless @facebook_accounts
  #    facebook_authentication = authentications.facebook.first
  #    uid = facebook_authentication.uid
  #    token = facebook_authentication.credentials['token']
  #    @facebook_accounts = FbGraph::User.fetch(uid, :access_token => token).accounts
  #  end
  #  @facebook_accounts
  #end
  #
  #def follows?(user)
  #  follows.where(:followable => user).present?
  #end
  #
  #def title; name; end
  #
  #def record_label_admin?
  #  owned_record_label.present?
  #end
  #
  #def missing_payment_info?
  #  !(bank_transfer_information.present? && (bank_transfer_information.iban.present? || bank_transfer_information.paypal_email.present?))
  #end
  #
  #def self.with_revenue_for_period(from, to)
  #  User.scoped & (Song.scoped & (PurchaseItem.scoped & Purchase.completed.where('? <= purchases.created_at and purchases.created_at < ?', from.to_date.to_time, to.to_date.to_time)))
  #end
  #
  #def revenue_for_period(from, to)
  #  (PurchaseItem.scoped & (Purchase.completed.where('? <= purchases.created_at and purchases.created_at < ?', from.to_date.to_time, to.to_date.to_time)) & Song.where(:user_id => id)).all.sum(&:price)
  #end
  #
  #def profit_for_period(from, to)
  #  revenue_for_period(from, to) * 50/100
  #end
  #
  #def payment_receiver
  #  return agents.first.user if agents.present?
  #  if record_label.present?
  #    if record_label.agents.present?
  #      return record_label.agents.first.user
  #    else
  #      return record_label.admin
  #    end
  #  end
  #  return self
  #end
  #
  #def payment_receiver_name
  #  return agents.first.user.name if agents.present?
  #  if record_label.present?
  #    if record_label.agents.present?
  #      return record_label.name + " (#{record_label.agents.first.user.name})"
  #    else
  #      return record_label.name + (record_label.admin ? " (#{record_label.admin.name})" : " (no admin)")
  #    end
  #  end
  #  return self.name
  #end
  #
  #def find_unbought_remix(original_id, remix_title)
  #  songs.find_by_remix_of_id_and_title(original_id, remix_title)
  #end
end
