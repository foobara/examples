#!/usr/bin/env ruby

require "foobara/remote_imports"

[9292, 9293].each do |port|
  Foobara::RemoteImports::ImportCommand.run!(manifest_url: "http://localhost:#{port}/manifest")
end

module FoobaraDemo
  module AnimalHouse
    foobara_domain!
  end
end

module FoobaraDemo
  module AnimalHouse
    class Animal < Foobara::Model
      attributes do
        first_name :string
        last_name :string
        birthday :date
        species :symbol, one_of: %i[capybara cat tartigrade]
      end
    end
  end
end

module FoobaraDemo
  module CapyCafe
    foobara_depends_on AnimalHouse

    module DomainMappers
      class MapAnimalToCapybara < Foobara::DomainMapper
        class NotACapybara < Foobara::RuntimeError
          context species: :symbol, animal: AnimalHouse::Animal

          attr_accessor :animal

          def initialize(animal)
            self.animal = animal
            super()
          end

          def context
            { animal:, species: animal.species }
          end

          def message
            "Can only import a capybara not a #{animal.species}"
          end
        end

        possible_error NotACapybara

        from AnimalHouse::Animal
        to CreateCapybara

        def map
          {
            name: "#{first_name} #{last_name}",
            age: birthday_to_age
          }
        end

        def validate
          species = animal.species

          unless species == :capybara
            add_error NotACapybara.new(animal)
          end
        end

        alias animal from

        foobara_delegate :first_name, :last_name, :birthday, to: :animal

        def birthday_to_age
          today = Date.today
          age = today.year - birthday.year
          birthday_this_year = Date.new(birthday.year + age, birthday.month, birthday.day)

          today < birthday_this_year ? age - 1 : age
        end
      end
    end

    class ImportAnimal < Foobara::Command
      inputs animal: AnimalHouse::Animal
      result Capybara

      depends_on CreateCapybara, DomainMappers::MapAnimalToCapybara

      def execute
        create_capybara

        capybara
      end

      attr_accessor :capybara

      def create_capybara
        self.capybara = run_mapped_subcommand!(CreateCapybara, animal)
      end
    end
  end
end

require "irb"
IRB.start(__FILE__)
