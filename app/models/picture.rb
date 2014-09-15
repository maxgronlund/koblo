class Picture < ActiveRecord::Base

  has_attached_file :picture, :processors => [:round_corners], 
    :styles => {
      :profile    => { :border_radius => 5, :format => :png, :geometry => '200x200#' },
      :profile_bw => { :border_radius => 5, :format => :png, :geometry => "200x200#" },
      :thumb      => { :border_radius => 5, :format => :png, :geometry => '48x48#' },
      :thumb_bw   => { :border_radius => 5, :format => :png, :geometry => '48x48#' },
      :studio     => { :border_radius => 5, :format => :png, :geometry => '60x60#' },
      :studio_bw  => { :border_radius => 5, :format => :png, :geometry => '60x60#' },
      :cart       => { :border_radius => 5, :format => :png, :geometry => '80x80#' },
      :front_page_10 => { :border_radius => 5, :format => :png, :geometry => '64x64#' },
      :front_page_5  => { :border_radius => 5, :format => :png, :geometry => '138x138#' },
      :front_page_4  => { :border_radius => 5, :format => :png, :geometry => '175x175#' },
      :front_page_2  => { :border_radius => 5, :format => :png, :geometry => '360x360#' },
    },
    :default_url => "/images/dummy_:style.png",
    :convert_options => { :profile_bw => "-colorspace Gray", :thumb_bw => "-colorspace Gray" }

  before_post_process :randomize_file_name

  delegate :url, :to => :picture

  attr_accessor :external_url

  before_validation :download_picture

  def self.with_attachment
    where(:picture_file_name.ne => nil)
  end

  def download_picture
    begin
      if !picture? && external_url.present?
        io = open(URI.parse(external_url).to_s)
        def io.original_filename; base_uri.path.split('/').last; end
        self.picture = io.original_filename.blank? ? nil : io
      end
    rescue Exception => e
      Rails.logger.error e.inspect
    end
  end

private

  def randomize_file_name
    extension = File.extname(picture_file_name).downcase
    self.picture.instance_write(:file_name, "#{ActiveSupport::SecureRandom.hex(16)}#{extension}")
  end

end

