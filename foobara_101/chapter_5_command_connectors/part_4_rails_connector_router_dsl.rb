# this goes in config/routes.rb

# rails new --api --skip-docker --skip-asset-pipeline --skip-javascript --skip-hotwire --skip-jbuilder --skip-test --skip-brakeman --skip-kamal --skip-solid rails_test_app

require "foobara/rails_command_connector"

Foobara::CommandConnectors::RailsCommandConnector.new

require "foobara/rails/routes"

Rails.application.routes.draw do
  command CreateCapybara
  command IncrementAge
  command FindCapybara
end
