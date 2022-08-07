env :GEM_PATH, '/usr/local/bundle' # defines where to find rake command
set :output, './log/cron.log' # log location

# We override rake job type, as we don't want envrinoment specific task
job_type :rake, "cd :path && bundle exec rake :task --silent :output"

# runs every hour
every 1.hour do
  # this will log in cron.log as defined above.
  runner "Chat.setChatCount"
  runner "Message.setMessageCount"

end
