#!/usr/bin/env ruby

require "foobara"
require "foobara/sh_cli_connector"

crud_driver = Foobara::Persistence::CrudDrivers::InMemory.new
Foobara::Persistence.default_crud_driver = crud_driver

class Capybara < Foobara::Entity
  attributes do
    id :integer
    name :string, :required, "Official name"
    nickname :string, "Informal name for friends"
    age :integer, :required, "The number of times this capybara has gone around the sun"
  end

  primary_key :id
end

class CreateCapybara < Foobara::Command
  description "Just creates a capybara!"

  inputs Capybara.attributes_type
  result Capybara

  def execute
    create_capybara

    capybara
  end

  attr_accessor :capybara

  def create_capybara
    self.capybara = Capybara.create(inputs)
  end
end

# $fumiko = CreateCapybara.run!(name: "Fumiko", nickname: "foo", age: 100)
# $barbara = CreateCapybara.run!(name: "Barbara", nickname: "bar", age: 200)
# $basil = CreateCapybara.run!(name: "Basil", nickname: "baz", age: 300)

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

# require "irb"
# IRB.start(__FILE__)

cli_command_connector = Foobara::CommandConnectors::ShCliConnector.new

cli_command_connector.connect(CreateCapybara)
cli_command_connector.connect(IncrementAge)

cli_command_connector.run(ARGV)
