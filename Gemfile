source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.1'

gem 'aws-sdk-s3', require: false
gem 'rails', '~> 7.0.2', '>= 7.0.2.4'
gem 'rails-i18n'
gem 'devise'
gem 'devise-i18n'
gem 'dotenv-rails'
gem 'file_validators'
gem 'sprockets-rails'
gem 'puma', '~> 5.0'
gem "image_processing", '~> 1.2'
gem 'jquery-rails'
gem 'jsbundling-rails'
gem 'mailjet', :git => 'https://github.com/mailjet/mailjet-gem.git'
gem 'turbo-rails'
gem 'stimulus-rails'
gem 'cssbundling-rails'
gem 'carrierwave'
gem 'rmagick'
gem 'jbuilder'
gem 'uglifier', '>= 1.3.0'
gem 'bootsnap', require: false
#gem 'whenever', :require => false

group :production do
  gem 'pg'
end

group :development, :test do
  gem 'sqlite3', '~> 1.4'
  gem 'byebug'
  gem 'debug', platforms: %i[ mri mingw x64_mingw ]
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end
