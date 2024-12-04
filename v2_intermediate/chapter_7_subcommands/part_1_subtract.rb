#!/usr/bin/env ruby

require "foobara"

class Add < Foobara::Command
  inputs do
    operand1 :integer, :required
    operand2 :integer, :required
  end

  result :integer

  def execute
    add_operands

    sum
  end

  attr_accessor :sum

  def add_operands
    self.sum = operand1 + operand2
  end
end

class Subtract < Foobara::Command
  inputs do
    operand1 :integer, :required
    operand2 :integer, :required
  end

  result :integer

  depends_on Add

  def execute
    subtract_operands

    difference
  end

  attr_accessor :difference

  def subtract_operands
    self.difference = run_subcommand!(Add, operand1:, operand2: -operand2)
  end
end

require "irb"
IRB.start(__FILE__)
