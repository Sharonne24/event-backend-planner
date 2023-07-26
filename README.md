
# Event Planner Website
This is an Event Planner Website that allows users to create, view, update, and delete events. 
The website is built using Ruby, Sinatra, and Active Record for the backend, and React for the frontend.
Users can sign up, log in, and perform CRUD operations on events.
# Table of Contents
- Features
- Installation
- Backend
- Frontend
- Technologies Used
- Contributing
# Features
- View a list of events with their names, dates, and locations.
- Create new events with names, dates, locations, and descriptions.
- View detailed information about each event, including its description.
- RSVP to events by providing your name and email.
- Edit event details including name, date, location, and description.
- Delete events from the list.
# Installation
To run the Event Planner website, follow these steps:

1) Clone the repository to your local machine.
2) Make sure you have Ruby, Sinatra, and Active Record installed on your backend.
3) Navigate to the backend directory and run the following commands:

   bundle install
   rake db:migrate

Start the backend server using:
   ruby app.rb

Navigate to the frontend directory and run the following command to install dependencies:
   npm install

Start the frontend development server using:
   npm start
The website should now be accessible at http://localhost:3000/.

# Backend
The backend of the Event Planner website is built using Ruby with Sinatra and Active Record.
It provides API endpoints to handle event CRUD operations, including creating new events, fetching event details, updating events, and deleting events.
The backend also manages RSVPs by allowing users to submit their names and email addresses for events.

# Frontend
The front end of the Event Planner website is developed using React.js. It provides a user-friendly interface for users to interact with the website.
The front end communicates with the backend API to fetch event data, create new events, update event details, and manage RSVPs.

# Technologies Used
- Ruby
- Sinatra
- Active Record
- React.js

# Contributing
Contributions to the Event Planner website are welcome! 
If you find any issues or have suggestions for improvements, please feel free to open an issue or submit a pull request.
