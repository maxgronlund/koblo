class UserType < ActiveRecord::Base
  has_many :users
  has_and_belongs_to_many :admin_messages

  scope :musicians_and_bands, where(:name => 'Musician/Band')
  scope :djs_and_producers, where(:name => 'dj/producer')
  scope :music_lovers, where(:name => 'Music Lover')
  scope :record_label_admins, where(:name => 'Record Label')
end
