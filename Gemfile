source 'https://rubygems.org'

#git_source(:github) do |repo_name|
#  repo_name = '#{repo_name}/#{repo_name}' unless repo_name.include?('/')
#  'https://github.com/#{repo_name}.git'
#end

gem 'rails', '~> 5.1.0'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'therubyracer', platforms: :ruby
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'redis', '~> 3.0'
gem 'sprockets', '>= 3.0.0'
gem 'devise', github: 'plataformatec/devise', branch: 'master'

group :development, :test do
  gem 'awesome_print'
  gem 'bullet'
  gem 'bundler-audit', '>= 0.5.0', require: false
  gem 'dotenv-rails'
  gem 'factory_girl_rails'
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'rspec-rails', '~> 3.5'
end

group :development do
  gem 'listen'
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'web-console'
end

group :test do
  gem 'database_cleaner'
  gem 'shoulda-matchers'
end
