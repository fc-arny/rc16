# frozen_string_literal: true
source 'https://rubygems.org'

gem 'rails', '~> 5.0.0'
gem 'active_model_serializers', '~> 0.10.0'

# Servers
gem 'puma'
gem 'pg', '~> 0.19'
gem 'redis-rails', '~> 5.0.1'

# Auth
gem 'devise', '~> 4.2.0'
gem 'omniauth'
gem 'omniauth-facebook'
gem 'omniauth-vkontakte'
gem 'omniauth-github'

gem 'simple_token_authentication'
gem 'activerecord-session_store', '~> 1.0.0'

gem 'pundit'

gem 'bourbon'
gem 'administrate', git: 'https://github.com/thoughtbot/administrate.git'

# Utils
gem 'config'
gem 'russian'
gem 'kaminari'
gem 'paperclip'
gem 'gravatar_image_tag'

gem 'sidekiq'
gem 'sidekiq-status'
gem 'sidekiq-failures'
gem 'sinatra', git: 'https://github.com/sinatra/sinatra.git', branch: :master

gem 'seedbank'

gem 'awesome_print', require: false
gem 'hirb', require: false
gem 'colorize'

# Client code
gem 'slim'
gem 'sass-rails', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'js-routes'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails'

gem 'compass-core',  git: 'https://github.com/Davidiusdadi/compass',  branch: 'core'
gem 'compass-rails'

# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

group :development, :test do
  # Deployment
  gem 'capistrano',         '~> 3.6', require: false
  gem 'capistrano-rails',   '~> 1.1', require: false
  gem 'capistrano-bundler',           require: false
  gem 'capistrano-rvm',               require: false
  gem 'capistrano-sidekiq',           require: false
  gem 'capistrano3-puma',             require: false

  # Debug tool for mail and errors
  gem 'better_errors'
  gem 'binding_of_caller'

  # Code Quality
  gem 'rubocop', require: false
  gem 'scss_lint', require: false
  gem 'brakeman', require: false
  gem 'bundler-audit', require: false
  gem 'bullet', require: false

  gem 'teaspoon'
  gem 'teaspoon-jasmine'

  # Tools
  gem 'meta_request'

  # Spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'spring-commands-rspec'
  gem 'spring-commands-spinach'
  gem 'spring-commands-teaspoon'

  # Testing
  gem 'rspec-rails'

  gem 'database_cleaner'
  gem 'factory_girl_rails'

  gem 'webmock'
  gem 'byebug'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
end
