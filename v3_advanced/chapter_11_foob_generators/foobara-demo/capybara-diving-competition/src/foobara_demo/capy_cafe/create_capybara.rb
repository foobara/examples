module FoobaraDemo
  module CapyCafe
    class CreateCapybara < Foobara::Command
      # class SomeError < RuntimeError
      #   class << self
      #     def context_type_declaration
      #       { foo: :string }
      #     end
      #   end
      # end

      # possible_error SomeError

      inputs do
        foo :string, default: "bar"
      end

      result :string

      # depends_on SomeOtherCommand

      def execute
        do_something
      end

      # def validate
      #   add_runtime_error SomeError.new(message: "kaboom", context: {foo: :bar})
      # end

      def do_something
        foo
      end
    end
  end
end
