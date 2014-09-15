class AdminMessage < ActiveRecord::Base
  #has_and_belongs_to_many :user_types
  #
  ## XXX move away from callback
  #after_create :send_emails
  #
  ## def self.front_page_scopes
  ##   [:random]
  ## end
  #
  ## def self.front_page_filter
  ##   scoped
  ## end
  #
  ## def self.with_picture
  ##   scoped
  ## end
  #
  #def self.random
  #  # The condition on created_at is to prevent query caching
  #  where(:created_at.lt => Time.now.utc).order('rand()')
  #end
  #
  #def high_priority?
  #  priority && priority > LOW
  #end
  #
  #def targeted_users
  #  user_types.map(&:users).flatten
  #end
  #
  #def send_emails
  #  AdminMessageMailer.new_admin_message(self)
  #end
end
