#!/usr/bin/env ruby

require "foobara"
require "foobara/local_files_crud_driver"
require "foobara/rack_connector"
require "rackup/server"

crud_driver = Foobara::LocalFilesCrudDriver.new
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

class FindCapybara < Foobara::Command
  description "Just tell us who you want to find!"

  inputs do
    id Capybara.primary_key_type, :required
  end

  result Capybara

  def execute
    load_capybara

    capybara
  end

  attr_accessor :capybara

  def load_capybara
    self.capybara = Capybara.load(id)
  end
end

class IncrementAge < Foobara::Command
  description "A trip around the sun!"

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

command_connector = Foobara::CommandConnectors::Http::Rack.new
$command_connector = command_connector

command_connector.connect(CreateCapybara)
command_connector.connect(IncrementAge)
command_connector.connect(FindCapybara)

# Rackup::Server.start(app: command_connector)

require "irb"
IRB.start(__FILE__)
