module FoobaraDemo
  module CapyCafe
    class Capybara < Foobara::Entity
      attributes do
        id :integer
        first_name :string, :required
      end

      primary_key :id
    end
  end
end
