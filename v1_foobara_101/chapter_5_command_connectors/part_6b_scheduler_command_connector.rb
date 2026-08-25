require "foobara/resque_scheduler_connector"

cron_connector = Foobara::CommandConnectors::ResqueSchedulerConnector.new

cron_connector.cron(
  [
    #   ╭─Second (0-59)
    #   │ ╭─Minute (0-59)
    #   │ │ ╭─Hour (0-23)
    #   │ │ │ ╭─Day-of-Month (1-31)
    #   │ │ │ │ ╭─Month (1-12)
    #   │ │ │ │ │ ╭─Day-of-Week (0-6)
    #   │ │ │ │ │ │ ╭─Timezone
    #   │ │ │ │ │ │ │   ╭─Command,      ╭─Inputs

    ["*/5 * * * * *  ", IncrementAge, { capybara: 1 }]
  ]
)
