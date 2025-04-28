source 'https://rubygems.org'

ruby '2.3.8'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Rails and core stack
gem 'rails', '~> 5.1.5'
gem 'puma',  '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'turbolinks',  '~> 5'
gem 'jbuilder',    '~> 2.5'

# Production-only database adapter
group :production do
  gem 'pg', '< 2'
end

# Development & test tools + SQLite for local use
group :development, :test do
  gem 'sqlite3'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  gem 'rails-controller-testing'
  gem 'factory_bot_rails', '~> 4.0'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'rspec-rails', '~> 3.7'
end

# Cross-platform timezone data (Windows etc.)
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# Auth, authorization, pagination, payments, security, caching
gem 'devise'
gem 'cancancan', '~> 1.10'
gem 'will_paginate', '~> 3.1.1'
gem 'stripe'
gem 'brakeman'
gem 'dalli'
gem 'redis-rails'