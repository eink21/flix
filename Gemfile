source 'https://rubygems.org'
ruby '2.1.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
#gem 'rails', '4.0.5' #original
gem 'rails', '4.1.4' #me

# Use sqlite3 as the database for Active Record
group :development, :test do 
	gem 'sqlite3' #original,me
end
group :production do 
	gem 'pg'
end

# For getting image uploads to work...
gem 'paperclip'
gem 'aws-sdk'

# Use SCSS for stylesheets
#gem 'sass-rails', '~> 4.0.2' #original
gem 'sass-rails', '~> 4.0.3' #me

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0' #original,me

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0' #original,me

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails' #original,me

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks' #original,me

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
#gem 'jbuilder', '~> 1.2' #original
gem 'jbuilder', '~> 2.0' #me

group :doc do #original
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false #original
end
#gem 'sdoc', '~> 0.4.0', group: :doc #me

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring', group: :development #me (not in original)


# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

group :test, :development do
  #gem "rspec-rails", "2.13.1" #original
  gem "rspec-rails" #me
end

group :test do
  #gem "capybara", "2.1.0" #original
  gem "capybara" #me
end
