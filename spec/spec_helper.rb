require 'rspec'
require 'pg'
require 'pry'
require 'project'

DB = PG.connect({ dbname: 'volunteer_tracker_test', host: 'db', user: 'postgres', password: 'password' })

RSpec.configure do |config|
  config.after(:each) do
    # Add code to clear database.
  end
end
