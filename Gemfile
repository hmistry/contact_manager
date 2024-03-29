source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.2'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'

# Use unicorn as the app server
gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
gem 'debugger', group: [:development, :test]


# Sass and Haml
gem 'bootstrap-sass'
gem 'haml'
gem 'haml-rails'

# needed for html2haml conversion
gem 'erb2haml', group: :development

# Other helper
gem 'simple_form'

# User authentication w/ roles
# gem 'devise'
# gem 'cancan'
# gem 'rolify'
gem 'omniauth'
gem 'omniauth-twitter'

# Store keys/passwords in yaml file
# gem 'figaro'

# Better debugging and guard
group :development do
  gem "better_errors"
  gem "binding_of_caller"
  # gem "rb-inotify", :require => false
  # gem "rb-fsevent", :require => false
  # gem "rb-fchange", :require => false
  gem "guard-rspec"
  gem "guard-spork"
end

# Testing, RSpec, Capybara
group :test do
  gem 'database_cleaner'
  # gem 'email_spec'
  gem 'launchy'
  gem 'capybara'
end

group :test, :development do
  gem 'rspec-rails', '~> 2.0'
  gem 'factory_girl_rails'
  gem 'shoulda-matchers'
  gem "spork-rails"

  # Use sqlite3 as the database for Active Record
  gem 'sqlite3'
end

group :production do
  # Use pg as the database for Active Record
  gem 'pg'
  gem 'rails_12factor'
end
