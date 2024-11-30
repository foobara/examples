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

require "irb"
IRB.start(__FILE__)
