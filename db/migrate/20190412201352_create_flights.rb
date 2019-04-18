class CreateFlights < ActiveRecord::Migration[5.2]
  def change
    create_table :flights do |t|

      t.date :date
      t.string :aircraft_type
      t.string :aircraft_registration
      t.string :pic_name
      t.string :copi_name
      t.string :engine_type
      t.float :day_time
      t.float :night_time
      t.integer :takeoffs_landings
      t.boolean :cross_country
      t.string :command_type
      t.string :from
      t.string :to
      t.float :actual_imc
      t.float :hood
      t.float :simulator_time
      t.integer :ifr_appr
      t.string :remarks

      t.references :user, index: true
      t.timestamps
    end
  end
end
