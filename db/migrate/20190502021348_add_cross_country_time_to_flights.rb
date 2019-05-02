class AddCrossCountryTimeToFlights < ActiveRecord::Migration[5.2]
  def change
    add_column :flights, :cross_country_day_time, :float
    add_column :flights, :cross_country_night_time, :float
  end
end
