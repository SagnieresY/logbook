class FlightsController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:import]
  before_action :set_flight, only: [:show, :edit, :update, :destroy]

  def index
    @flights = policy_scope(current_user.flights.order("date ASC"))
  end

  def simpleindex
    @flights = policy_scope(current_user.flights.order("date DESC"))
    authorize @flights
  end

  def show
  end

  def new
    @flight = current_user.flights.new
    authorize @flight
  end

  def create
    @flight = current_user.flights.new(flight_params)
    @flight.check_before_save
    authorize @flight

    if @flight.save
      redirect_to flights_path
    else
      render :new
    end
  end

  def edit
    authorize @flight
  end

  def update
    authorize @flight
    @flight.update(flight_params)

    if @flight.save
      redirect_to simpleindex_path
    else
      render :edit
    end
  end

  def destroy
    @flight.destroy
    redirect_to flights_path
  end

  def import
    authorize Flight
    Flight.import(params[:file], current_user)

    redirect_to root_url, notice: 'Flights imported.'
  end

  private

  def set_flight
    @flight = Flight.find(params[:id])
  end

  def flight_params
    params.require(:flight).permit(:date, :aircraft_type, :aircraft_registration, :pic_name, :copi_name, :engine_type, :day_time, :night_time, :simulator, :ifr_appr, :takeoffs_landings, :cross_country, :command_type, :from, :to, :remarks, :cross_country_time)
  end
end
