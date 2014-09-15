class Song < ActiveRecord::Base
  MIXDOWN_WAVEFORM_WIDTH ||= 467
  MIXDOWN_WAVEFORM_HEIGHT ||= 15

  

  #belongs_to :user
  #has_many :tracks, :order => "position", :dependent => :destroy
  ## has_many :ratings
  #belongs_to :genre
  #has_many :remixes, :class_name => 'Song', :foreign_key => 'remix_of_id'
  #belongs_to :remix_of, :class_name => 'Song', :foreign_key => 'remix_of_id'
  #has_many :remix_settings, :class_name => 'RemixSettings'
  #has_many :pending_social_network_messages
  #
  #has_many :purchase_items
  #
  #has_attached_file :mixdown
  #has_attached_file :multitrack_zip_file
  #has_attached_file :waveform
  #
  #before_validation :update_remix_title
  #validates :bpm, :numericality => true, :allow_blank => true
  #validates_inclusion_of :remix_usage, :in => %w{ sell_immediately sell_after_approval preview }, :allow_nil => true, :allow_blank => true
  #
  #accepts_nested_attributes_for :tracks, :allow_destroy => true
  #
  #scope :newest, order('songs.created_at DESC')
  #scope :newest_released, order('songs.released_at DESC')
  #scope :unreleased, where(:released_at => nil)
  #
  #
  #scope :released, where( :released_at  != nil)
  #
  #scope :future, where( :released_at  != nil)
  #scope :remix, where(:remix_of_id => nil)
  #scope :with_user, where(:user_id => nil)
  #
  #
  #scope :original, where(:remix_of_id => nil)
  #
  #
  #scope :starting_with, lambda { |*args| { :conditions => ["title like ?", args.first + '%'] } }
  #
  #has_many :timeline_events, :as => :subject, :dependent => :destroy
  #
  #
  #
  #after_create :request_approval
  #after_create :enqueue_background_jobs
  #
  #def self.released
  #  where(:released_at.lt => DateTime.now)
  #end
  #
  #def self.most_downloaded
  #  (Song.joins(:purchase_items.outer) & PurchaseItem.joins(:purchase.outer)).group('songs.id').order('count(purchase_items.id) DESC')
  #end
  #
  #def self.front_page_scopes
  #  [:best, :newest_released, :most_downloaded, :random]
  #end
  #
  #def self.front_page_filter
  #  where(:remix_of_id => nil)
  #end
  #
  #def self.random
  #  # The condition on created_at is to prevent query caching
  #  where(:created_at.lt => Time.now.utc).order('rand()')
  #end
  #
  ## def rating
  ##   ratings.average(:value) || 0
  ## end
  #
  #define_index do
  #  indexes :title
  #end
  #
  #def enqueue_background_jobs
  #  # Resque.enqueue_in(5.seconds, CreateMixdown, id)
  #  Resque.enqueue_in(5.minutes, SendSongUploadedMail, id)
  #end
  #
  #def master
  #  if remix?
  #    remix_of.master
  #  else
  #    self
  #  end
  #end
  #
  #def multitrack_price(currency)
  #  return Money.new(0, currency) unless multitrack_tier
  #  Money.new(Price.new(master.multitrack_tier).send(currency.downcase) * 100, currency.upcase)
  #end
  #
  #def mixdown_price(currency)
  #  Money.new(Price.new(mixdown_tier).send(currency.downcase) * 100, currency.upcase)
  #end
  #
  #def remix_price(currency)
  #  # Remix and mixdown cost the same
  #  mixdown_price(currency)
  #end
  #
  #def ringtone_price(currency)
  #  Money.new(Price.new(ringtone_tier).send(currency.downcase) * 100, currency.upcase)
  #end
  #
  ## def generate_waveforms
  ##   tracks.each { |track| Resque.enqueue_in(5.seconds, CreateWaveform, Track.to_s, track.id, track.uploaded_data.path, duration) }
  ## end
  #
  ## def self.regenerate_waveforms
  ##   all.each { |song| song.generate_waveforms }
  ## end
  #
  #def price_range(currency)
  #  if remix_of
  #    [mixdown_price(currency), mixdown_price(currency)]
  #  else
  #    prices = [multitrack_price(currency), mixdown_price(currency)]
  #    [prices.min, prices.max]
  #  end
  #end
  #
  ## def generate_mixdown_waveform
  ##   CreateWaveform.perform_delegate(Song.to_s, id, mixdown.path, duration, MIXDOWN_WAVEFORM_WIDTH, MIXDOWN_WAVEFORM_HEIGHT)
  ## end
  #
  ## def self.regenerate_mixdown_waveform
  ##   all.select(&:mixdown?).each(&:generate_mixdown_waveform)
  ## end
  #
  #def calculate_bpm
  #  if mixdown?
  #    wavfile  = TempfileWithExtension.new('mixdown.wav')
  #    `sox #{mixdown.path} -c 2 -2 -L -r 44100 #{wavfile.path}`
  #    song_bpm = `bpmcount #{wavfile.path}`
  #    song_bpm =~ /^(\d+\.\d+)/
  #    update_attribute(:bpm, $1.to_f)
  #  end
  #end
  #
  #def calculate_sample_rate_and_precision
  #  if tracks.present? && tracks.first.uploaded_data? && File.exists?(tracks.first.uploaded_data.path)
  #    song_info = `sox -V #{tracks.first.uploaded_data.path} - 2>&1`
  #    self.sample_rate = song_info.gsub(/.*Sample Rate.*?(\d+).*/m, '\1').to_i
  #    self.precision = song_info.gsub(/.*Sample Size.*?:\s*(\S*)\W.*/m, '\1')
  #    save
  #  end
  #end
  #
  #def update_remix_title
  #  if title.blank? && remix?
  #    self.title = tracks.first.title if tracks.present?
  #    self.title = remix_of.title if title.blank?
  #  end
  #end
  #
  #def remix?
  #  remix_of.present?
  #end
  #
  #def original?
  #  remix_of.blank?
  #end
  #
  #def released?
  #  !!released_at
  #end
  #
  #def display_title
  #  user.name + ' - ' + title
  #end
  #
  #def picture
  #  remix? ? remix_of.try(:user).try(:picture) : user.try(:picture)
  #end
  #
  #def self.with_picture
  #  Song.includes(:user => :picture) & User.scoped & Picture.with_attachment
  #end
  #
  #def create_remix_settings
  #  remix_settings.destroy_all
  #  
  #  doc = Nokogiri::XML(xml)
  #  (doc/:track).each_with_index do |e, i|
  #    track = remix_of.tracks[i]
  #    if (e/:name).text == track.title
  #      track_remix_settings = remix_settings.new(:track => track)
  #      %w{fx1 fx2 solo mute pan vol}.each do |field|
  #        track_remix_settings.send(field + '=', (e/field.to_sym).text)
  #      end
  #      track_remix_settings.save!
  #    end
  #  end
  #end
  #
  #def formatted_released_at
  #  released_at.present? ? released_at.strftime("%d/%m/%Y %H:%M") : ""
  #end
  #
  #def formatted_released_at=(value)
  #  self.released_at = Chronic.parse value
  #end
  #
  #def owned_by?(some_user)
  #  return false unless some_user.present?
  #  (original? && user_id == some_user.id) || some_user.purchased_songs.include?(self)
  #end
  #
  #def multitrack_owned_by?(some_user)
  #  return false unless some_user
  #  (original? && user_id == some_user.id) || some_user.bought_multitracks.include?(self)
  #end
  #
  #def send_pending_social_network_messages
  #  if released_at && released_at < DateTime.now
  #    pending_social_network_messages.unsent.each(&:send!)
  #  end
  #end
  #
  #def play_in_studio?
  #  remix? && tracks.size == 0
  #end
  #
  #def accept_remixes?
  #  remix_usage.present?
  #end
  #
  #def may_sell_immediately?
  #  remix_usage == "sell_immediately"
  #end
  #
  #def self.sold_count
  #  (PurchaseItem.completed & PurchaseItem.scoped).count
  #end
  #
  #def for_sale?
  #  !remix? || may_sell_immediately? || approved_by_artist?
  #end
  #
  #def request_approval
  #  return unless remix? && original.remix_usage == "sell_after_approval"
  #  SongApprovalRequest.create_from_song(self)
  #end
  #
  #def original
  #  remix? ? remix_of.original : self
  #end
  #
  #def artist
  #  original.user
  #end
  #
  #def artist_name
  #  artist.name
  #end
  #
  #
  #def record_label
  #  artist.record_label
  #end
  #
  #
  #def approved_by_artist!
  #  update_attribute(:approved_by_artist, true)
  #end
  #
  ## From http://masanjin.net/blog/how-to-rank-products-based-on-user-input.html
  ### input is a five-element array of integers
  ### output is a score between 1.0 and 5.0
  ## def update_score
  ##   votes = [0, 0, 0, 0, 0]
  ##   ratings.each { |rating| votes[rating.value - 1] += 1 }
  #
  ##   prior = [2, 2, 2, 2, 2]
  ##   posterior = votes.zip(prior).map { |a, b| a + b }
  ##   sum = posterior.inject { |a, b| a + b }
  ##   new_score = posterior.
  ##     map.with_index { |v, i| (i + 1) * v }.
  ##     inject { |a, b| a + b }.
  ##     to_f / sum
  #
  ##   update_attribute(:score, new_score)
  ##   score
  ## end
  #
  #def project?
  #  tracks.empty?
  #end
  #
  ## TODO: Move to presenter
  #def num_tracks
  #  tracks.count
  #end
  #
  #def name
  #  user ? user.name : ""
  #end
  #
  #def self.create_import(user, title, zipfile)
  #  create!(:user => user, :title => title, :multitrack_zip_file => zipfile, :importing => true)
  #end
  #
  #def multitrack_zip_path
  #  multitrack_zip_file.path
  #end
  #
  #def self.featured(minimum_count = 0)
  #  songs = where(:featured => true).to_a
  #  if (shortage = minimum_count - songs.size) > 0
  #    songs += Song.where(:featured => false).first(shortage)
  #  end
  #
  #  songs
  #end
end
