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
gem 'pundit'
gem "image_processing", '~> 1.2'
gem 'jquery-rails'
gem 'jsbundling-rails'
gem 'mailjet', :git => 'https://github.com/mailjet/mailjet-gem.git'
gem 'omniauth-github', '~> 1.1', '>= 1.1.2'
gem 'omniauth-vkontakte'
gem "omniauth-yandex"
gem 'omniauth-google-oauth2'
gem 'turbo-rails'
gem 'resque'
gem 'stimulus-rails'
gem 'cssbundling-rails'
gem 'carrierwave'
gem 'rmagick'
gem 'jbuilder'
gem 'uglifier', '>= 1.3.0'
gem 'bootsnap', require: false
gem 'whenever', :require => false

group :production do
  gem 'pg'
end

group :development, :test do
  gem 'byebug'
  gem 'capistrano', '~> 3.8'
  gem 'capistrano-rails', '~> 1.2'
  gem 'capistrano-passenger', '~> 0.2'
  gem 'capistrano-rbenv', '~> 2.1'
  gem 'capistrano-bundler', '~> 1.2'
  gem 'capistrano-resque', '~> 0.2.3', require: false
  gem 'debug', platforms: %i[ mri mingw x64_mingw ]
  gem "letter_opener", group: :development 
  gem 'rspec-rails'
  gem 'sqlite3', '~> 1.4'
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end
