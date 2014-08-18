source 'https://rubygems.org'
ruby '2.0.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.4'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# Use jquery as the JavaScript library
gem 'jquery-rails'

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
group :development do
  gem 'spring'
  gem 'dotenv-rails'
  gem 'sqlite3'
  gem 'debugger'
  gem 'better_errors'
  gem 'binding_of_caller'
end

gem 'omniauth'
gem 'omniauth-slack'
gem 'slack-api', :git => 'https://github.com/captn3m0/slack-ruby-gem.git'
gem 'httparty'
gem 'omniauth-google-oauth2'
gem 'email_reply_parser'

group :production do
   gem 'unicorn'
   gem 'rails_12factor'
   gem 'pg'
end