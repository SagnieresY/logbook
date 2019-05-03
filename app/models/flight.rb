class Flight < ApplicationRecord
  require 'roo'

  validates_presence_of :date, :engine_type, :command_type
  validates :cross_country, :inclusion => { :in => [true, false] }

  belongs_to :user
  validates_presence_of :user

  scope :single_engine, -> { where(engine_type: 'single') }
  scope :multi_engine, -> { where(engine_type: 'multi') }
  scope :dual, -> { where(command_type: 'dual') }
  scope :pic, -> { where(command_type: 'pic') }
  scope :co_pilot, -> { where(command_type: 'co-pilot') }
  scope :night, -> { where("night_time > ?", 0) }
  scope :day_only, -> { where(:night_time => [nil,0]) }
  scope :cross_country, -> { where(cross_country: true) }

  def dual?
    return command_type.downcase == 'dual'
  end

  def pic?
    return command_type.downcase == 'pic'
  end

  def co_pilot?
    return command_type.downcase == 'co-pilot'
  end

  def multi?
    return engine_type.downcase == 'multi'
  end

  def single?
    return engine_type.downcase == 'single'
  end

  def night_time?
    return night_time != nil
  end

  def day_time?
    return day_time != nil
  end

  def simu?
    return simulator_time != nil && simulator_time != 0
  end

  def check_before_save
    engine_type.downcase!
    command_type.downcase!

    #makes uppercase airport & aircraft
    from.upcase! if !from.nil?
    to.upcase! if !to.nil?
    aircraft_type.upcase! if !aircraft_type.nil?
    aircraft_registration.upcase! if !aircraft_type.nil?

    #titleize names
    pic_name.titleize if !pic_name.nil?
    copi_name.titleize if !copi_name.nil?

    #check if cross country was forgotten but there are hours
    if !cross_country? && !cross_country_day_time.nil?
      return update(cross_country:true)
    end

    if !cross_country? && !cross_country_night_time.nil?
      return update(cross_country:true)
    end

    #if cross country TRUE but no time specified -- uses the full flight time
    if cross_country? && cross_country_day_time.nil?
      cross_country_day_time == day_time
    end

    if cross_country? && cross_country_night_time.nil?
      cross_country_night_time == night_time
    end
  end

  def self.import(file, user)
    spreadsheet = Roo::Spreadsheet.open(file.path)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      flight = find_by(id: row["id"]) || new
      flight.attributes = row.to_hash
      flight.user = user
      flight.check_before_save
      flight.save!
    end
  end
end
