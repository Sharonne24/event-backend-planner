
puts "🌱 Seeding events..."
Event.create(name: "Birthday Bash", datetime: "2023-07-24 10:00", location: "The Grand Hall", description: "A grand birthday celebration with friends and family.")
Event.create(name: "Tech Conference", datetime: "2023-08-15 09:30", location: "Tech Center", description: "An industry-leading conference showcasing the latest tech innovations.")
Event.create(name: "Art Exhibition", datetime: "2023-07-28 13:00", location: "City Art Gallery", description: "An art exhibition featuring works from local and international artists.")
Event.create(name: "Charity Run", datetime: "2023-07-30 08:00", location: "Central Park", description: "A charity run to raise funds for a worthy cause.")
Event.create(name: "Music Festival", datetime: "2023-08-05 18:00", location: "Festival Grounds", description: "A music festival with popular bands and artists performing live.")
Event.create(name: "Food Truck Fair", datetime: "2023-07-27 12:00", location: "City Square", description: "A food truck fair with a variety of delicious cuisines.")
Event.create(name: "Movie Night", datetime: "2023-08-02 19:30", location: "Community Park", description: "An outdoor movie night for families to enjoy.")
Event.create(name: "Sports Tournament", datetime: "2023-08-10 09:00", location: "Sports Complex", description: "A sports tournament featuring multiple sports disciplines.")
Event.create(name: "Fashion Show", datetime: "2023-07-26 20:00", location: "Fashion Mall", description: "A glamorous fashion show showcasing the latest trends.")
Event.create(name: "Book Launch", datetime: "2023-08-01 18:30", location: "Bookstore", description: "An author's book launch event with a book signing session.")
Event.create(name: "Anime Convention", datetime: "2023-08-20 10:00", location: "Convention Center", description: "A celebration of anime and Japanese pop culture. Join us for cosplay, screenings, guest panels, and more!")


puts "🌱 Seeding users..."
User.create(email: "sawuor395@gmail.com", password_digest: "1234567")
User.create(email: "shammy24@gmail.com", password_digest: "234567")
# Seed your database here

 puts "✅ Done seeding!"


