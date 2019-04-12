class CreateFlights < ActiveRecord::Migration[5.2]
  def change
    create_table :flights do |t|

      t.date :date
      t.string :aircraft_type
      t.string :aircraft_registration
      t.string :pic_name
      t.string :copi_name
      t.string :engine_type
      t.integer :day_time
      t.integer :night_time
      t.boolean :simulator
      t.integer :takeoffs_landings
      t.boolean :cross_country
      t.string :command_type
      t.string :from
      t.string :to

      t.timestamps
    end
  end
end
