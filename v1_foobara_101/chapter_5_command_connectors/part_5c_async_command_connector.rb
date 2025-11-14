#!/usr/bin/env ruby

require_relative "part_5c_async_command_connector_domain"
require "foobara/resque_connector"

connector = Foobara::CommandConnectors::ResqueConnector.new
connector.connect(IncrementAge)
