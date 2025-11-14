require "bundler/setup"

require "foobara/local_files_crud_driver"

Foobara::Persistence.default_crud_driver = Foobara::LocalFilesCrudDriver.new(multi_process: true)

class Capybara < Foobara::Entity
  description "A giant semi-aquatic rodent"

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

class IncrementAge < Foobara::Command
  description "A trip around the sun without dying!"

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

class FindAllCapybaras < Foobara::Command
  result [Capybara]

  def execute
    find_all_capybaras
  end

  def find_all_capybaras
    Capybara.all
  end
end
