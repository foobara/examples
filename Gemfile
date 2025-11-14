source 'https://rubygems.org'

gem 'foobara', ">= 0.2.6"
gem "foobara-local-files-crud-driver"
gem "foobara-rack-connector"
gem "foobara-resque-connector"
gem "foobara-resque-scheduler-connector"
gem "foobara-sh-cli-connector"

gem "puma"
gem "rack"
gem "rake"

group :development do
  gem "foobara-rubocop-rules", ">= 1.0.0"

  gem "rubocop-rake"
  gem "rubocop-rspec"

  gem "pry"
  gem "pry-byebug"
  # TODO: Just adding this to suppress warnings seemingly coming from pry-byebug. Can probably remove this once
  # pry-byebug has irb as a gem dependency
  gem "irb"
end
