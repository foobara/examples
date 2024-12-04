#!/usr/bin/env ruby

require "foobara"

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

  inputs Capybara.attributes_for_create
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
