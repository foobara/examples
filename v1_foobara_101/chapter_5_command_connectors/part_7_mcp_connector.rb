# !/usr/bin/env ruby

ENV["BUNDLE_GEMFILE"] ||= File.expand_path("#{__dir__}/Gemfile")
require "bundler/setup"

require "foobara/mcp_connector"
require "foobara/local_files_crud_driver"

Foobara::Persistence.default_crud_driver = Foobara::LocalFilesCrudDriver.new

class Capybara < Foobara::Entity
  attributes do
    id :integer
    name :string, :required
    year_of_birth :integer, :required
  end

  primary_key :id
end

class CreateCapybara < Foobara::Command
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

class UpdateCapybara < Foobara::Command
  inputs Capybara.attributes_for_update
  result Capybara

  def execute
    load_capybara
    update_capybara

    capybara
  end

  attr_accessor :capybara

  def load_capybara
    self.capybara = Capybara.load(id)
  end

  def update_capybara
    capybara.update(inputs)
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

capybaras = FindAllCapybaras.run!

capybara_names = capybaras.map(&:name)

unless capybara_names.include?("Fumiko")
  CreateCapybara.run!(name: "Fumiko", year_of_birth: 2020)
end

unless capybara_names.include?("Barbara")
  CreateCapybara.run!(name: "Barbara", year_of_birth: 2019)
end

unless capybara_names.include?("Basil")
  CreateCapybara.run!(name: "Basil", year_of_birth: 2021)
end

# For this example, let's intentionally break a Capybara's age by using a
# 2-digit age instead of 4-digit and see if the MCP client can fix it

capybaras = FindAllCapybaras.run!

barbara = capybaras.find { |c| c.name == "Barbara" }

# We will simulate a year accidentally being entered with a 2-digit format
# where a 4-digit format was expected
UpdateCapybara.run!(id: barbara.id, year_of_birth: 19)

mcp_connector = Foobara::McpConnector.new

mcp_connector.connect(FindAllCapybaras)
mcp_connector.connect(UpdateCapybara)

mcp_connector.run_stdio_server
