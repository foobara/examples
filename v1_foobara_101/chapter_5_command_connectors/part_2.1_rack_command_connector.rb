#!/usr/bin/env ruby

require "bundler/setup"

require "foobara/rack_connector"
require "foobara"

class Add < Foobara::Command
  inputs do
    operand1 :integer, :required
    operand2 :integer, :required
  end

  result :integer

  def execute
    add_operands
  end

  attr_accessor :sum

  def add_operands
    self.sum = operand1 + operand2
  end
end

command_connector = Foobara::CommandConnectors::Http::Rack.new
command_connector.connect(Add)

command_connector.run_puma
