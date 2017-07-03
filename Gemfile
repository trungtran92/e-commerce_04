source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "bcrypt", "~> 3.1.7"
gem "bootstrap-sass", "~> 3.3.6"
gem "carrierwave", "~> 0.10.0"
gem "chatwork"
gem "chartkick"
gem "config"
gem "coffee-rails", "~> 4.2"
gem "devise"
gem "figaro"
gem "google-api-client"
gem "mini_magick", "~> 4.3"
gem "kaminari"
gem "jbuilder", "~> 2.5"
gem "jquery-rails", "4.3.1"
gem "omniauth"
gem "omniauth-google-oauth2"
gem "omniauth-facebook"
gem "omniauth-twitter"
gem "puma", "~> 3.7"
gem "rails", "~> 5.1.1"
gem "ratyrate"
gem "roo"
gem "rubocop", "~> 0.49.1", require: false
gem "sass-rails", "~> 5.0"
gem "social-share-button"
gem "turbolinks", "~> 5"
gem "turbolinks", "~> 5"
gem "uglifier", "~> 1.3.0"

group :development, :test do
  gem "sqlite3"
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "capybara", "~> 2.13"
  gem "selenium-webdriver"
end

group :development do
  gem "sqlite3"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 3.3.0"
end

group :production do
  gem "pg", "0.18.4"
  gem "rails_12factor"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
