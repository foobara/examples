#!/usr/bin/env ruby

require "foobara"

class Greet < Foobara::Command
  inputs do
    who :string, default: "World"
  end
  result :string

  def execute
    build_greeting

    greeting
  end

  attr_accessor :greeting

  def build_greeting = self.greeting = "Hello, #{who}!"
end

puts Greet.run!
puts Greet.run!(who: "Fumiko")

outcome = Greet.run(who: "Barbara")

puts outcome.success? ? outcome.result : outcome.errors_hash

command = Greet.new(who: "Basil")
outcome = command.run

puts outcome.success? ? outcome.result : outcome.errors_hash
