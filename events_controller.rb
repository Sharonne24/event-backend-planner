# backend/controllers/events_controller.rb
class EventsController < Sinatra::Base
    # Index: Get all events
    get "/api/events" do
      events = Event.all
      events.to_json
    end
  
    # Show: Get a single event by ID
    get "/api/events/:id" do
      event = Event.find(params[:id])
      event.to_json
    end
  
    # Create: Add a new event
    post "/api/events" do
      request_body = JSON.parse(request.body.read)
      event = Event.new(request_body)
      if event.save
        status 201
        event.to_json
      else
        status 422
        { error: "Failed to create the event" }.to_json
      end
    end
  
    # Update: Update an existing event
    put "/api/events/:id" do
      event = Event.find(params[:id])
      request_body = JSON.parse(request.body.read)
      if event.update(request_body)
        event.to_json
      else
        status 422
        { error: "Failed to update the event" }.to_json
      end
    end
  
    # Delete: Delete an event
    delete "/api/events/:id" do
      event = Event.find(params[:id])
      if event.destroy
        status 204
      else
        status 422
        { error: "Failed to delete the event" }.to_json
      end
    end
  end
  