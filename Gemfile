source 'http://rubygems.org'

gem 'rails', '3.2.0'
gem 'mysql2'
gem 'whenever', :require => false
gem 'uglifier'
gem 'hpricot'
gem 'minitest'

gem 'jquery-rails'
gem 'haml'
gem 'therubyracer'
gem 'kaminari'

group :assets do
  gem 'sass-rails', "  ~> 3.2.3"
  gem 'coffee-rails', "~> 3.2.1"
  gem 'uglifier'
end

group :development do
  gem 'annotate', :git => 'git://github.com/ctran/annotate_models.git'
end

group :development, :test do
  gem 'rspec-rails'
  gem 'spork'
  gem 'guard-spork'
  gem 'guard-rspec'
  gem 'rb-fsevent'
  gem 'factory_girl_rails'
  gem 'simplecov', :require => false
  gem 'ci_reporter', :require => 'ci/reporter/rake/rspec'
  gem 'growl'
  gem 'turn', '~> 0.8.3', :require => false
end

group :production do
  gem 'unicorn'
end
