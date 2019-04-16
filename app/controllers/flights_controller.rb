class FlightsController < ApplicationController

  def index
    @flights = Flight.all
  end

  def show
  end

  def new
    @flight = Flight.new
  end

  def create
    flight = Flight.new(flight_params)
    flight.save
    redirect_to flights_path
  end

  def edit
  end

  def update
    @flight.update(flight_params)
    redirect_to flight_path(@flight)
  end

  def destroy
    @flight.destroy
    redirect_to flights_path
  end

  private

  def set_flight
    @flight = Flight.find(params[:id])
  end

  def flight_params
    params.require(:flight).permit(:date, :aircraft_type, :aircraft_registration, :pic_name, :copi_name, :engine_type, :day_time, :night_time, :simulator, :takeoffs_landings, :cross_country, :command_type, :from, :to)
  end
end
