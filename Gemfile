source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.1'
#hould be listed in the Gemfile before any other gems that use environment variables, otherwise those gems will get initialized with the wrong values
gem 'dotenv-rails', :groups => [:development, :test]

# Use sqlite3 as the database for Active Record
gem 'sqlite3'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby
group :production do
	gem 'pg'
end

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring', group: :development

#new gems

#lab 1

#lab 2
gem 'carrierwave'
gem 'bootstrap-sass'
gem 'rmagick', :require => 'RMagick'
gem 'aws-sdk'
gem 'fog'

#lab 3
gem 'devise'

group :development do
	gem 'better_errors'
	gem 'quiet_assets'
  gem 'pry'
  gem "binding_of_caller"
end