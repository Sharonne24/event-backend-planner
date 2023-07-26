# backend/database.rb
require "sinatra/activerecord"

# Define the database connection
db_config = {
  adapter: "sqlite3",
  database: "event_planner.db",
}

ActiveRecord::Base.establish_connection(db_config)

# Load all models
Dir["./models/*.rb"].each { |file| require file }
