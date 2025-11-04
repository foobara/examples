#!/usr/bin/env ruby

require "foobara"

class Greet < Foobara::Command
  inputs { who :string, default: "World" }
  result :string

  def execute
    "Hello, #{who}!"
  end
end

puts Greet.run!
puts Greet.run!(who: "Fumiko")

outcome = Greet.run(who: "Barbara")

puts outcome.success? ? outcome.result : outcome.errors_hash

command = Greet.new(who: "Basil")
outcome = command.run

puts outcome.success? ? outcome.result : outcome.errors_hash
