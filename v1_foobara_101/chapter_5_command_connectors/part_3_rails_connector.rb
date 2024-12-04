# this goes in routes.rb

# rails new --api --skip-docker --skip-asset-pipeline --skip-javascript --skip-hotwire --skip-jbuilder --skip-test --skip-brakeman --skip-kamal --skip-solid rails_test_app

require "foobara/rails_command_connector"

Foobara::CommandConnectors::RailsCommandConnector.new

command_connector.connect(CreateCapybara)
command_connector.connect(IncrementAge)
command_connector.connect(FindCapybara)
