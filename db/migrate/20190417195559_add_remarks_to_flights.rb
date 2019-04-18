class AddRemarksToFlights < ActiveRecord::Migration[5.2]
  def change
    add_column :flights, :remarks, :string
  end
end
