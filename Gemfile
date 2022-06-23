# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.0'

gem 'aasm', '~> 5.2'
gem 'bootsnap', '>= 1.4.4', require: false
gem 'devise', '~> 4.8', '>= 4.8.1'
gem 'devise-i18n', '~> 1.10', '>= 1.10.2'
gem 'figaro', '~> 1.2'
gem 'jbuilder', '~> 2.7'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'rails', '~> 6.1.5'
gem 'rubocop', '~> 1.30', '>= 1.30.1'
gem 'sass-rails', '>= 6'
gem 'simple_form', '~> 5.1'
gem 'turbolinks', '~> 5'
gem 'webpacker', '~> 5.0'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
end

group :development do
  gem 'listen', '~> 3.3'
  gem 'spring'
  gem 'web-console', '>= 4.1.0'
end

group :test do
  gem 'capybara', '>= 3.26'
  gem 'webdrivers'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
