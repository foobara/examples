#!/usr/bin/env ruby

require "foobara"

class DoNothing < Foobara::Command
end

require "irb"
IRB.start(__FILE__)
