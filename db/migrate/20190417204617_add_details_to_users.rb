class AddDetailsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :radio_certificate, :integer
    add_column :users, :aviation_document, :string
    add_column :users, :aviation_document_date, :date
    add_column :users, :pilot_license_number, :integer
    add_column :users, :pilot_license_type, :string
    add_column :users, :medical_date, :date
    add_column :users, :medical_category, :integer
    add_column :users, :instrument_rating_date, :date
    add_column :users, :instrument_rating_renewal_date, :date
    add_column :users, :night_rating_date, :date
    add_column :users, :FAA_PPL_Conversion_date, :date
  end
end
