#!/usr/bin/env ruby

require_relative "part_5c_async_command_connector_domain"
require "foobara/sh_cli_connector"

command_connector = Foobara::CommandConnectors::ShCliConnector.new

command_connector.connect(CreateCapybara)
command_connector.connect(IncrementAge)
command_connector.connect(FindAllCapybaras)

command_connector.run
