source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.3'
# Use sqlite3 as the database for Active Record
gem 'pg', '~> 1.1', '>= 1.1.4'
# Use Puma as the app server
gem 'puma', '~> 4.3'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use Json Web Token (JWT) for token based authentication
gem 'jwt'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors'

# Ruby library that pretty prints Ruby objects in full color
gem 'awesome_print'

# A lightning fast JSON:API serializer for Ruby Objects.
gem 'fast_jsonapi'

# Compose your business logic into commands that sanitize and validate input
gem 'mutations'

# A Scope & Engine based, clean, powerful, customizable and sophisticated paginator for modern web app frameworks and ORMs
gem 'kaminari'

# Ransack enables the creation of both simple and advanced search forms for your
# Ruby on Rails application
gem 'ransack', github: 'activerecord-hackery/ransack'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'dotenv-rails'
  # Using RSpec for testing.
  gem 'rspec-rails', '~> 3.5'
  # A fixtures replacement with a more straightforward syntax.
  gem 'factory_bot_rails', '~> 4.0'
  # A library for generating fake data.
  gem 'faker'
end

group :test do
  # Provides RSpec with additional matchers.
  gem 'shoulda-matchers', '~> 3.1'
  # Cleans test database to ensure a clean state in each test suite.
  gem 'database_cleaner'
  # Test code coverage for Ruby
  gem 'simplecov', require: false
  gem 'rspec_junit_formatter'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end


# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
