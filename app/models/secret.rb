class Secret
  #def self.token
  #  '269ec40fa7d73a19c981546340869d7262af66830277aa32ac6048a78595008e8d9271ed3c54599f8a36c3b249517e1f72e7c28c9b15a5597b63a4e1636adc1e'
  #end
  #
  #def self.token_for_track?(token, track, format)
  #  track && track.song && track.song.user && track_digest(track, format) == token
  #end
  #
  #def self.bought_digest(song)
  #  Digest::SHA1("#{song.user.name}#{song.title}#{self.token}")
  #end
  #
  #private
  #def self.track_digest(track, format)
  #  Digest::SHA1.hexdigest("#{track.song.user.name}#{track.song.title}#{track.title}#{format}#{self.token}")
  #end
end
