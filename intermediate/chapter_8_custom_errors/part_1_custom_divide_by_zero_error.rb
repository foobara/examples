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

class Divide < Foobara::Command
  # TODO: remove ::Value once foobara is pushed again
  possible_input_error :divisor, :divide_by_zero, message: "Cannot divide by zero"

  inputs do
    dividend :integer, :required
    divisor :integer, :required
  end

  result :integer

  depends_on Subtract

  def execute
    initialize_quotient_to_zero
    make_operands_positive_and_determine_if_result_is_negative

    until dividend_less_than_divisor?
      increment_quotient
      subtract_divisor_from_dividend
    end

    negate_quotient if negative_result?

    quotient
  end

  def validate
    if divisor == 0
      add_input_error :divisor, :divide_by_zero
    end
  end

  attr_accessor :negative_result, :quotient

  def make_operands_positive_and_determine_if_result_is_negative
    self.negative_result = false

    if dividend < 0
      self.dividend = -dividend
      self.negative_result = !negative_result
    end

    if divisor < 0
      self.divisor = -divisor
      self.negative_result = !negative_result
    end
  end

  def negate_quotient
    self.quotient = -quotient
  end

  def dividend_less_than_divisor?
    dividend < divisor
  end

  def negative_result?
    negative_result
  end

  def increment_quotient
    self.quotient += 1
  end

  def subtract_divisor_from_dividend
    self.dividend = run_subcommand!(Subtract, operand1: dividend, operand2: divisor)
  end

  def initialize_quotient_to_zero
    self.quotient = 0
  end

  attr_writer :dividend, :divisor

  def dividend
    @dividend || super
  end

  def divisor
    @divisor || super
  end
end

require "irb"
IRB.start(__FILE__)
