#!/usr/bin/env ruby

require "foobara"
require "foobara/local_files_crud_driver"

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

require "foobara/resque_connector"

async_connector = Foobara::CommandConnectors::ResqueConnector.new

async_connector.connect(IncrementAge)

require "foobara/resque_scheduler_connector"

cron_connector = Foobara::CommandConnectors::ResqueSchedulerConnector.new

cron_connector.cron(
  [
    #   ╭─Second (0-59)
    #   │ ╭─Minute (0-59)
    #   │ │ ╭─Hour (0-23)
    #   │ │ │ ╭─Day-of-Month (1-31)
    #   │ │ │ │ ╭─Month (1-12)
    #   │ │ │ │ │ ╭─Day-of-Week (0-6)
    #   │ │ │ │ │ │ ╭─Timezone
    #   │ │ │ │ │ │ │   ╭─Command,      ╭─Inputs
    ["*/5 * * * * *  ", IncrementAge, { capybara: 1 }]
  ]
)

require "foobara/sh_cli_connector"

cli_connector = Foobara::CommandConnectors::ShCliConnector.new

cli_connector.connect(IncrementAge)
cli_connector.connect(IncrementAgeAsync)
cli_connector.connect(FindCapybara)

if ARGV == ["work"]
  Thread.new do
    Resque::Scheduler.verbose = true
    Resque::Scheduler.run
  end

  worker = Resque::Worker.new("*")
  worker.verbose = true
  worker.work(1)
else
  cli_connector.run(ARGV)
end
