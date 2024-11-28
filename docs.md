What is foobara??

Foobara is a software framework with a focus on applications with complex business domains. It helps manage complexity with a number of features and tools. Commands encapsulate high-level business operations and serve as the public interface of systems/subsystems. This can help with mental-models and communication and reasoning about systems. It provides "discoverability," or automated machine-readable metadata, which enables abstracting away integration code which results in the actual problem/solution domain being not only expressed in the codebase but dominant in the code base. This includes abstracting away whether a command is implemented locally or remotely potentially even in a different programming language. This also has the unintended benefit of a faster development cycles since there is less code to write and test.

other things that help with managing domain complexity:
* domain mappers
* custom crud drivers
  * to abstract away mis-modelled legacy data schemas
  * to facilitate complex data migrations with zero-downtime
* extract-repo program
  * can be used to quickly extract a subset of the code in one repository (commands, tests, whatever) to a new foobara project in its own repository preserving git history.
    * This helps with re-architecting systems without much if any refactoring of the current implementation of those commands or its dependencies.
* command connectors
  * quickly expose commands in various different contexts without having to refactor those commands.
* remote commands (and entities/models/types/domains/organizations)
  * allows invocation of commands without having to know if those commands are
    implemented locally or remotely
* namespacing including organizations and domains
  * crud drivers to decouple data persistence details from domain logic


concepts:

basics

command

type
  integer

domain
organization
  
model
entity
  crud driver

command connector
  cli
  http
    rack
    rails

manifest data

remote commands

domain mappers

intermediate

commands
  sub commands
  errors

types
  hierarchy of built-in types
  custom types derived from existing using processors

entities
  associations

command connectors
  http
    importing remote commands


advanced

commands
  callbacks
  transactions

types
  different sugars

entities
  callbacks
  atoms and aggregates

typescript remote commands

EXPERT

crud drivers
  custom crud drivers

command connectors
  custom command connectors

custom types
  handlers
  desugarizers
  validators
