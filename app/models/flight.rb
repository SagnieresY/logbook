class Flight < ApplicationRecord
  scope :single_engine, -> { where(engine_type: 'single') }
  scope :multi_engine, -> { where(engine_type: 'multi') }
  scope :dual, -> { where(command_type: 'Dual') }
  scope :pic, -> { where(command_type: 'PIC') }
  scope :co_pilot, -> { where(command_type: 'Co-pilot') }
  scope :night, -> { where("night_time > ?", 0) }
  scope :day_only, -> { where(:night_time => [nil,0]) }
  scope :cross_country, -> { where(cross_country: true) }
end
