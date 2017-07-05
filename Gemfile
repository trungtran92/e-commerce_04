source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "bcrypt", "~> 3.1.7"
gem "bootstrap-sass", "~> 3.3.6"
gem "carrierwave", "~> 0.10.0"
gem "chatwork"
gem "config"
gem "coffee-rails", "~> 4.2"
gem "devise"
gem "omniauth"
gem "omniauth-google-oauth2"
gem "omniauth-facebook"
gem "omniauth-twitter"
gem "google-api-client"
gem "jbuilder", "~> 2.5"
gem "puma", "~> 3.7"
gem "rails", "~> 5.1.1"
gem "sqlite3"
gem "sass-rails", "~> 5.0"
gem "social-share-button"
gem "ratyrate"
gem "roo"
gem "turbolinks", "~> 5"
gem "turbolinks", "~> 5"
gem "uglifier", "~> 1.3.0"
gem "kaminari"
gem "rubocop", "~> 0.49.1", require: false
gem "jquery-rails", "4.3.1"
gem "mini_magick", "~> 4.3"
gem "figaro"

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "capybara", "~> 2.13"
  gem "selenium-webdriver"
end

group :development do
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 3.3.0"

end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
