class ApplicationController < Sinatra::Base
    set :default_content_type, 'application/json'
    class EventsController < ApplicationController
    #get all events
    get "/events" do
     events = Event.all
     events.to_json
    end
  
    # Add a new event
    post "/events" do
       event = Event.create(name: params[:name], datetime: params[:datetime], location: params[:location], description: params[:description])
      status 201
      event.to_json
    end

    #delete an event 
    delete "/events/:id" do
      event = Event.find(params[:id])
      if event.destroy
        status 204
      else
        status 422
        { error: "Failed to delete the event" }.to_json
      end
    end

    #get a single event by id
    get "/events/:id" do
      event = Event.find(params[:id])
      event.to_json
    end

    #update an existing event
    put "/events/:id" do
      event = Event.find(params[:id])
      request_body = JSON.parse(request.body.read)
      if event.update(request_body)
        event.to_json
      else
        status 422
        { error: "Failed to update the event" }.to_json
      end
    end

    
  
  
