
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

# app.rb

get '/' do
  erb :index
end


# RSVP to an event (API endpoint)
post '/api/events/:event_id/rsvp' do
  event = Event.find(params[:event_id])
  guest = Guest.find_or_initialize_by(user_id: session[:user_id], event_id: event.id)
  guest.rsvp_status = true
  if guest.save
    status 200
    { message: 'RSVP successful' }.to_json
  else
    status 400
    { errors: guest.errors.full_messages }.to_json
  end
end

# Invite a guest to an event (API endpoint)
post '/api/events/:event_id/invite' do
  event = Event.find(params[:event_id])
  guest_email = params[:email]

  # Send invitation email to the guest (you'll need to implement this)

  status 200
  { message: 'Invitation sent successfully' }.to_json
end
