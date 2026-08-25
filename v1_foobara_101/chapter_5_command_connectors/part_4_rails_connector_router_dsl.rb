require "foobara/rails_command_connector"
Foobara::CommandConnectors::RailsCommandConnector.new
require "foobara/rails/routes"

Rails.application.routes.draw do
  command CreateCapybara
  command IncrementAge
  command FindCapybara
end
