require_relative "../../part_3_rails_connector"
require "foobara/rails_command_connector"

Foobara::CommandConnectors::RailsCommandConnector.new

# command_connector.connect(CreateCapybara)
# command_connector.connect(IncrementAge)
# command_connector.connect(FindCapybara)

require "foobara/rails/routes"

Rails.application.routes.draw do
  command CreateCapybara
  command IncrementAge
  command FindCapybara

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
