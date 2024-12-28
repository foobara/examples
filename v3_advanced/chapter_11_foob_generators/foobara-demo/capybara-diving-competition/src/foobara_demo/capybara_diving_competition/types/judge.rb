module FoobaraDemo
  module CapybaraDivingCompetition
    class Judge < Foobara::Entity
      attributes do
        id :integer
        first_name :string, :required
      end

      primary_key :id
    end
  end
end
