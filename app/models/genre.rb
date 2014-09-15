class Genre < ActiveRecord::Base
  has_many :songs

  has_friendly_id :name, :use_slug => true, :approximate_ascii => true

  def self.frontpage
    joins(:songs).group('genre_id').order('count(songs.id) desc').limit(5)
  end

  def size
    songs.count
  end

  def deletable?
    empty?
  end

  def empty?
    size == 0
  end

  def self.non_empty
    order("name").reject(&:empty?)
  end
end
