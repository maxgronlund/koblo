class Remix < ActiveRecord::Base
  belongs_to :user
  mount_uploader :image, ImageUploader
  #mount_uploader :cover_art, RemixCoverUploader
  
  SONG_FILE = ['Ace of Base', 'Nephew', 'Hard Up', 'Superstition', 'Medina']
  

  scope :original_remixes,  ->    { where( original_mix:  true).order("title asc")  }
  scope :featured,          ->    { where( featured:  true).order("title asc")  }
  
end
