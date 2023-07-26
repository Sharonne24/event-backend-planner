# db/migrate/create_guests.rb

class CreateGuests < ActiveRecord::Migration[6.1]
    def change
      create_table :guests do |t|
        t.integer :user_id
        t.integer :event_id
        t.boolean :rsvp_status, default: false
  
        t.timestamps
      end
    end
  end
  