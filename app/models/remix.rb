class Remix < ActiveRecord::Base
  belongs_to :user
  mount_uploader :image, ImageUploader
  #mount_uploader :cover_art, RemixCoverUploader
  
  SONG_FILE = ['Ace of Base', 'Nephew']
end
