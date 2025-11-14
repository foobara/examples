#!/usr/bin/env ruby

require_relative "part_5c_async_command_connector"

fumiko = CreateCapybara.run!(name: "Fumiko", nickname: "foo", age: 100)
barbara = CreateCapybara.run!(name: "Barbara", nickname: "bar", age: 100)

IncrementAgeAsync.run!(capybara: fumiko)
2.times { IncrementAgeAsync.run!(capybara: barbara) }
