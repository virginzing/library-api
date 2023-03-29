source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.2"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem 'rails', '~> 6.1', '>= 6.1.7.3'

# Use postgresql as the database for Active Record
gem "pg", "~> 1.1"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "~> 5.0"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
# gem "jbuilder"

# Use Redis adapter to run Action Cable in production
# gem "redis", "~> 4.0"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem "rack-cors"

# Use dry for service patterns.
gem 'dry-initializer', '~> 3.1', '>= 3.1.1'
gem 'dry-monads', '~> 1.6'

# Use swagger for document APIs.
gem 'rswag-ui', '~> 2.8'
gem 'rswag-api', '~> 2.8'

# Use sidekiq for background job processing.
gem 'sidekiq', '~> 7.0', '>= 7.0.7'
gem 'sidekiq-cron', '~> 1.10'

# Use serializers for JSON rendering.
gem 'jsonapi-serializer', '~> 2.2'

# Use cors for public api
gem 'rack-cors', '~> 2.0', '>= 2.0.1'

# Use jwt for authentication token.
gem 'jwt', '~> 2.7'

# Use bcrypt for password encryption.
gem 'bcrypt', '~> 3.1', '>= 3.1.18'

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri mingw x64_mingw ]

  # Use rspec for automated testing.
  gem 'rspec', '~> 3.12'
  gem 'rspec-rails', '~> 6.0', '>= 6.0.1'
  gem 'rswag-specs', '~> 2.8'
end

group :development do
  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
  gem 'faker'
end

