#require 'audio_converter'

class Track < ActiveRecord::Base
  #attr_accessor :page_id

  belongs_to :song
  belongs_to :user
  #acts_as_list :scope => :song

  #has_attached_file :uploaded_data, :path => ':rails_root/public/system/:class/:id_partition/:attachment.:extension',
  #                                  :url  =>                   '/system/:class/:id_partition/:attachment.:extension'
  #has_attached_file :mp3,           :path => ':rails_root/public/system/:class/:id_partition/:attachment.:extension',
  #                                  :url  =>                   '/system/:class/:id_partition/:attachment.:extension'
  #has_attached_file :wav,           :path => ':rails_root/public/system/:class/:id_partition/:attachment.:extension',
  #                                  :url  =>                   '/system/:class/:id_partition/:attachment.:extension'
  #has_attached_file :waveform,      :path => ':rails_root/public/system/:class/:id_partition/:attachment.:extension',
  #                                  :url  =>                   '/system/:class/:id_partition/:attachment.:extension'
  #
  # after_create :process_audio

  # def process_audio
  #   Resque.enqueue(AudioConverter, id, @page_id)
  # end

  def self.create_from_wavfile(song, filename, wav)
    #title = CreatesPrettyName.from_filename(filename)
    #Track.create!(:song => song, :title => title, :wav => wav)
  end

end
