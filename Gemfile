# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.2'

gem 'bootsnap', require: false
gem 'cssbundling-rails'
gem 'dotenv-rails', '~> 2.8.1'
gem 'dry-validation', '~> 1.10.0'
gem 'interactor-rails', '~> 2.2.1'
gem 'jbuilder'
gem 'jsbundling-rails'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'pundit', '~> 2.3.0'
gem 'rails', '~> 7.0.7', '>= 7.0.7.2'
gem 'sprockets-rails'
gem 'strong_migrations', '~> 1.6.0'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'bullet', '~> 7.0.7'
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'dockerfile-rails', '>= 1.4.1'
  gem 'factory_bot_rails', '~> 6.2.0'
  gem 'ffaker', '~> 2.21.0'
  gem 'pry-rails', '~> 0.3.9'
end

group :development do
  gem 'brakeman', '~> 6.0.0', require: false
  gem 'bundler-audit', '~> 0.9.1', require: false
  gem 'bundler-leak', '~> 0.3.0', require: false
  gem 'lefthook', '~> 1.4.1', require: false
  gem 'rubocop', '~> 1.51.0', require: false
  gem 'rubocop-i18n', '~> 3.0.0', require: false
  gem 'rubocop-performance', '~> 1.18.0', require: false
  gem 'rubocop-rails', '~> 2.19.1', require: false
  gem 'rubocop-rake', '~> 0.6.0', require: false
  gem 'rubocop-rspec', '~> 2.22.0', require: false
  gem 'traceroute', '~> 0.8.1'
  gem 'web-console'
end

group :test do
  gem 'pundit-matchers', '~> 3.1'
  gem 'rspec-rails', '~> 6.0.2'
  gem 'shoulda-matchers', '~> 5.3.0'
end
