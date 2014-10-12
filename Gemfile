source 'https://rubygems.org'
#ruby '2.1.0'
gem 'rails', '4.1.4'
gem 'pg'
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0',          group: :doc
#gem 'bootstrap-sass'
gem 'bootstrap-sass', '~> 3.1.1.0'
gem 'simple_form', '~> 3.1.0.rc1', github: 'plataformatec/simple_form', branch: 'master'
gem 'devise'


#Koblo
gem "slim-rails"
gem 'country_select'
gem "awesome_print"
#gem 'backbone-on-rails'
gem 'kaminari'
gem 'kaminari-bootstrap', '~> 3.0.1'
gem 'carrierwave'
gem 'mini_magick'
gem 'sidekiq'

#Use unicorn as the app server
gem 'unicorn'
gem 'thin'


group :development do
  # Use Capistrano for deployment
  gem 'capistrano'
  
  gem 'capistrano-rbenv'
  
  # rails specific capistrano functions
  gem 'capistrano-rails'
  
  # integrate bundler with capistrano
  gem 'capistrano-bundler'

  gem 'capistrano-sidekiq'
  
  gem 'spring'
  gem 'byebug'
  
  gem 'better_errors'
  gem 'binding_of_caller', :platforms=>[:mri_21]
  gem 'quiet_assets'
  gem 'rails_layout'
end
group :development, :test do
  gem 'factory_girl_rails'
  gem 'rspec-rails'
end
group :test do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'faker'
  gem 'launchy'
  gem 'selenium-webdriver'
end
