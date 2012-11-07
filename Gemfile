source :rubygems

gemspec

local_path = File.expand_path('../railsyard-backend', File.dirname(__FILE__))

if Dir.exists? local_path
  gem 'railsyard-backend', path: local_path
else
  gem 'railsyard-backend', github: 'cantierecreativo/railsyard-backend', branch: 'develop'
end

group :development do
  gem 'sqlite3'
  gem 'rspec-rails'
  gem 'kramdown'
  gem 'rubygems-tasks'
  gem 'rspec'
  gem 'yard'
  gem 'bundler'
  gem 'rake'
end
