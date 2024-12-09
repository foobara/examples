#!/usr/bin/env ruby

require "foobara"

module FoobaraExamples
  foobara_organization!

  module IntegerMath
    foobara_domain!

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
  end
end

require "irb"
IRB.start(__FILE__)
