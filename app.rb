
require 'sinatra'
require 'sinatra/activerecord'

# Set up the database connection (adjust the database name as needed)
set :database, { adapter: 'sqlite3', database: 'event_planner.db' }
set :views, File.join(File.dirname(__FILE__), 'views')

# Define the Event model
class Event < ActiveRecord::Base
end

# Enable sessions to manage user login (for simplicity, this example won't include authentication)
enable :sessions

# Register a new user (API endpoint)
post '/api/register' do
  user = User.new(email: params[:email], password: params[:password])
  if user.save
    status 201
    { message: 'User registered successfully' }.to_json
  else
    status 400
    { errors: user.errors.full_messages }.to_json
  end
end

# Log in (API endpoint)
post '/api/login' do
  user = User.find_by(email: params[:email])
  if user && user.authenticate(params[:password])
    status 200
    { message: 'Login successful', user_id: user.id }.to_json
  else
    status 401
    { message: 'Invalid credentials' }.to_json
  end
end

# Log out (API endpoint)
post '/api/logout' do
  session.clear
  status 200
  { message: 'Logged out successfully' }.to_json
end


# Home page
get '/' do
  @events = Event.all
  erb :index
end

# Create a new event (show the form)
get '/events/new' do
  erb :new_event
end

# Create a new event (process the form)
post '/events' do
  Event.create(params[:event])
  redirect '/'
end

# Edit an existing event (show the form)
get '/events/:id/edit' do
  @event = Event.find(params[:id])
  erb :edit_event
end

# Update an existing event (process the form)
put '/events/:id' do
  @event = Event.find(params[:id])
  @event.update(params[:event])
  redirect '/'
end

# Delete an event
delete '/events/:id' do
  Event.find(params[:id]).destroy
  redirect '/'
end


# update an event
put '/events/:id' do
  content_type :json
  event = Event.find(params[:id])
  if event
    request_body = JSON.parse(request.body.read)
    if event.update(request_body)
      { message: 'Event updated successfully' }.to_json
    else
      { error: 'Failed to update event' }.to_json
    end
  else
    status 404
    { error: 'Event not found' }.to_json
  end
end

