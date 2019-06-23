# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
ENV["RAILS_ENV"] = "development"
set :output, '/Users/mohitagarwal/mohit/token-problem/log/whenever.log'
#
every 1.minutes do
    rake "token_life_cycle:start"
  end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
