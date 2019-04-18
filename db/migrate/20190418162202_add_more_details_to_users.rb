class AddMoreDetailsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :FAA_PPL_license, :integer
    add_column :users, :FAA_CPL_license, :integer
    add_column :users, :FAA_CPL_conversion_date, :date
    add_column :users, :biennial_flight_review, :date
  end
end
