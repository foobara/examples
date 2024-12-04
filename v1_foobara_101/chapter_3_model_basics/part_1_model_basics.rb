#!/usr/bin/env ruby

require "foobara"

class Capybara < Foobara::Model
  attributes do
    name :string, :required, "Official name"
    nickname :string, "Informal name for friends"
    age :integer, :required, "The number of times this capybara has gone around the sun"
  end
end

$fumiko = Capybara.new(name: "Fumiko", nickname: "foo", age: 100)
$barbara = Capybara.new(name: "Barbara", nickname: "bar", age: 200)
$basil = Capybara.new(name: "Basil", nickname: "baz", age: 300)

require "irb"
IRB.start(__FILE__)