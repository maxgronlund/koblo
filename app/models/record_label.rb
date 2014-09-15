class RecordLabel < ActiveRecord::Base
  has_many :artists, :class_name => 'User'
  has_many :songs, :through => :artists
  has_many :banners
  has_many :agencies
  has_many :agents, :through => :agencies
  belongs_to :admin, :class_name => 'User'
  validates_uniqueness_of :name
  validates_presence_of :name
  validates_length_of :description, :maximum => 400
  before_validation :cleanup_name
  has_friendly_id :name, :use_slug => true, :approximate_ascii => true

  belongs_to :picture
  accepts_nested_attributes_for :picture

  scope :starting_with, lambda { |*args| { :conditions => ["name like ?", args.first + '%'] } }
  scope :alphabetical, order(:name)

  before_save :add_picture

  def cleanup_name
    unless name.blank?
      name.gsub!(/\W+/, ' ')
      name.strip!
    end
  end

  def self.front_page_scopes
    [:random]
  end

  def self.front_page_filter
    scoped
  end

  def self.random
    # The condition on created_at is to prevent query caching
    where(:created_at.lt => Time.now.utc).order('rand()')
  end

  def title; name; end

  def self.with_picture
    RecordLabel.scoped & Picture.with_attachment
  end

  def add_picture 
    self.picture = Picture.create if !picture
  end

  def website_url
    return "" unless website.present? 
    website.starts_with?('http') ? website : 'http://' + website
  end

end
