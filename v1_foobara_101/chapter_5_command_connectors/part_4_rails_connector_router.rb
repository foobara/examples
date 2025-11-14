require "foobara/rails_command_connector"

connector = Foobara::CommandConnectors::RailsCommandConnector.new

connector.connect(CreateCapybara)
connector.connect(IncrementAge)
connector.connect(FindCapybara)
