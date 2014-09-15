class Agent < ActiveRecord::Base
  #belongs_to :user
  #has_many :agencies
  #has_many :artists, :through => :agencies, :source => :artist
  #has_many :record_labels, :through => :agencies, :source => :record_label
  #
  #attr_reader :artist_tokens
  #attr_reader :record_label_tokens
  #
  #def user_tokens
  #  [user_id]
  #end
  #
  #def user_tokens=(ids)
  #  self.user_id = ids.split(",").first
  #end
  #
  #def artist_tokens=(ids)
  #  agencies.select { |agency| agency.artist.present? }.each(&:destroy)
  #  ids.split(",").each do |id|
  #    agencies.build(:artist_id => id)
  #  end
  #end
  #
  #def record_label_tokens=(ids)
  #  self.record_label_ids = ids.split(",")
  #end
end
