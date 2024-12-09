#!/usr/bin/env ruby

require "foobara/remote_imports"
require "foobara/local_files_crud_driver"

crud_driver = Foobara::LocalFilesCrudDriver.new
Foobara::Persistence.default_crud_driver = crud_driver

[9292, 9293].each do |port|
  Foobara::RemoteImports::ImportCommand.run!(manifest_url: "http://localhost:#{port}/manifest")
end

module FoobaraDemo
  module CapybaraDivingCompetition
    foobara_domain!
  end
end

module FoobaraDemo
  module CapybaraDivingCompetition
    class Judge < Foobara::Model
      attributes do
        email :string, :downcase, matches: /\A[^@]+@[^@]+\.[^@]+\z/
      end
    end
  end
end

require "irb"
IRB.start(__FILE__)
