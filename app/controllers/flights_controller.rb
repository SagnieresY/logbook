class FlightsController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:index]
  before_action :set_flight, only: [:show, :edit, :update, :destroy]

  def index
    @flights = policy_scope(current_user.flights)
  end

  def show
  end

  def new
    @flight = current_user.flights.new
    authorize @flight
  end

  def create
    @flight = current_user.flights.new(flight_params)
    authorize @flight

    if @flight.save
      redirect_to flights_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @flight.update(flight_params)

    if @flight.save
      redirect_to @flight
    else
      render :edit
    end
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
    params.require(:flight).permit(:date, :aircraft_type, :aircraft_registration, :pic_name, :copi_name, :engine_type, :day_time, :night_time, :simulator, :takeoffs_landings, :cross_country, :command_type, :from, :to, :remarks)
  end
end
