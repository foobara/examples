#!/usr/bin/env ruby

require "foobara"
require "foobara/remote_imports"

Foobara::RemoteImports::ImportCommand.run!(manifest_url: "http://localhost:9292/manifest", cache: true)

require "irb"
IRB.start(__FILE__)
