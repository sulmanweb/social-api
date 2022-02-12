source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.1'
# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1', '>= 1.1.4'
# Use Puma as the app server
gem 'puma', '~> 4.3'
# Use Active Model has_secure_password
gem 'bcrypt', '~> 3.1', '>= 3.1.13'
# Use Active Storage variant
gem 'image_processing', '~> 1.9', '>= 1.9.3'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '~> 1.4', '>= 1.4.5', require: false

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors', '~> 1.1'

# GraphQL support
gem 'graphql', '~> 1.9', '>= 1.9.16'
gem 'graphiql-rails', '~> 1.7'
gem 'sprockets', '~> 3.7', '>= 3.7.2'
# To generate fake data
gem 'faker', '~> 2.8', '>= 2.8.1'
# for jwt authentication token
gem 'jwt', '~> 2.2', '>= 2.2.1'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # for RSpec Testing
  gem 'rspec-rails', '~> 4.0.0.beta3'
  gem 'factory_bot_rails', '~> 5.1', '>= 5.1.1'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # for spring based RSpec
  gem 'spring-commands-rspec', '~> 1.0', '>= 1.0.4'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
