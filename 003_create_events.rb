# backend/db/migrate/001_create_events.rb
class CreateEvents < ActiveRecord::Migration[6.1]
    def change
      create_table :events do |t|
        t.string :name
        t.date :date
        t.time :time
        t.string :location
        t.text :description
  
        t.timestamps
      end
    end
  end
  

 
