Foobara 101

1. Command Basics
  a. no-op command
  b. run/outcome interface
2. type basics: command that has typed inputs/result
  a. make an Add command
  b. call with bad inputs to show outcome errors
3. domain basics
  a. put Add in a Math domain
  b. carry out some domain method not on Module
4. organization basics
  a. put Math in a FoobaraDemo organization
  b. carry out some organization method not on Module
5. model basics
  a. Foobara::CapyCafe::Capybara model (name/age)
  b. IncrementAge command
    i. call with a capybara
    ii. call with attributes
6. upgrade to entity
  a. InMemory crud driver at first?
  b. upgrade to LocalFilesCrudDriver?
7. Command connectors
  a. cli
  b. http
    i. rack
    ii. rails


Intermediate

7. Manifest metadata?
8. Remote command basics
   a. import from another process and call IncrementAge
1. commands
  a. make a Subtract command via #run_subcommand
  b. make an integer division method
2. errors
  a. make a custom DivideByZero error

Advanced

9. Domain mappers
   a. make a domain mapper
   i. Maybe map from some Animal model?
   Animal.names[0].first + last...
   Birthday to age?
10. types
  a. custom types
  b. demonstrate casting by returning attributes instead of a Capybara
  a. attributes types w/ processors
    i. :required
    ii. :allow_nil
11. entities
    12. associations
0. creating stand-alone foobara projects
   1. ruby
   2. typescript

Expert

1. command
   c. callbacks: event log use-case
   d. transactions in commands
4. creating transactions in the console/tests
1. custom crud driver
  a. read/write to yaml file
2. custom command connector
  a. maybe grpc or something? probably something rpc related is the easiest?
5. value processors
3. custom types from scratch
  a. complex type
4. namespaces
5. extract-repo tool
