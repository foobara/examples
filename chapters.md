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
    iii. demonstrate casting by returning attributes instead of a Capybara
6. upgrade to entity
  a. InMemory crud driver
7. Command connectors
  a. cli
  b. http
    i. rack
    ii. rails
7. Manifest metadata
8. Remote command basics
  a. import from another process and call IncrementAge

Intermediate

1. commands
  a. make a Subtract command via #run_subcommand
  b. make an integer division method
2. errors
  a. make a custom DivideByZero error
3. models
  a. immutability

Advanced

1. command 
  c. callbacks: event log use-case
  d. transactions in commands

expert
1. custom crud driver
  a. read/write to yaml file
2. custom command connector
  a. maybe grpc or something? probably something rpc related is the easiest?
5. value processors
3. custom types from scratch
  a. complex type
4. namespaces
