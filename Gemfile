source 'http://rubygems.org'

gem 'rails', '3.1.0'
gem 'jquery-rails'
gem 'mysql2'
gem 'whenever', :require => false
gem 'uglifier'
gem 'therubyracer'
gem 'minitest'

gem 'haml-rails'
gem 'hpricot'
gem 'kaminari'

group :assets do
  gem 'sass-rails', "  ~> 3.1.0"
  gem 'coffee-rails', "~> 3.1.0"
  gem 'uglifier'
end

group :development do
  gem 'annotate', :git => 'git://github.com/ctran/annotate_models.git'
end

group :test do
  gem 'turn', :require => false
end

group :production do
  gem 'unicorn'
end

group :development, :test do
  gem 'rspec-rails'
  gem 'spork'
  gem 'guard-spork'
  gem 'guard-rspec'
  gem 'rb-fsevent'
  gem 'factory_girl_rails'
  gem 'simplecov', :require => false
  gem 'ci_reporter'
  gem 'growl'
end
