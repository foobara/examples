#!/usr/bin/env ruby

require "foobara"

class Capybara < Foobara::Model
  attributes do
    name :string
    nickname :string
    age :integer
  end
end

$fumiko = Capybara.new(name: "Fumiko", nickname: "foo", age: 100)
$barbara = Capybara.new(name: "Barbara", nickname: "bar", age: 200)
$basil = Capybara.new(name: "Basil", nickname: "baz", age: 300)

class IncrementAge < Foobara::Command
  inputs do
    capybara Capybara, :required
  end

  result Capybara

  def execute
    increment_age

    capybara
  end

  def increment_age
    capybara.age += 1
  end
end

require "irb"
IRB.start(__FILE__)
