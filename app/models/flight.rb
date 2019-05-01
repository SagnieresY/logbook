class Flight < ApplicationRecord
  require 'roo'

  validates_presence_of :date, :engine_type, :command_type, :cross_country

  belongs_to :user
  validates_presence_of :user

  scope :single_engine, -> { where(engine_type: 'single') }
  scope :multi_engine, -> { where(engine_type: 'multi') }
  scope :dual, -> { where(command_type: 'Dual') }
  scope :pic, -> { where(command_type: 'PIC') }
  scope :co_pilot, -> { where(command_type: 'Co-pilot') }
  scope :night, -> { where("night_time > ?", 0) }
  scope :day_only, -> { where(:night_time => [nil,0]) }
  scope :cross_country, -> { where(cross_country: true) }

  def self.import(file, user)
    spreadsheet = Roo::Spreadsheet.open(file.path)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      flight = find_by(id: row["id"]) || new
      flight.attributes = row.to_hash
      flight.user = user
      flight.save!
    end
  end
end
