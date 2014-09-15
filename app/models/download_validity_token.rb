class DownloadValidityToken < ActiveRecord::Base

  before_validation :generate_nonce, :set_default_validity

  validates_presence_of :nonce, :validity

  def generate_nonce
    self.nonce ||= SecureRandom.hex(4)
  end

  def set_default_validity
    self.validity ||= 20.minutes
  end

  def valid_at?(t)
    t < (self.created_at + validity)
  end

  class << self
    def valid_nonce?(nonce, t = Time.now)
      token = self.find_by_nonce(nonce)
      token && token.valid_at?(t)
    end

    def shared_valid_nonce(t = Time.now)
      token = DownloadValidityToken.last || DownloadValidityToken.create!
      token_midlife = token.created_at + (token.validity / 2)
      token = DownloadValidityToken.create! if t > token_midlife
      token.nonce
    end
  end
end
