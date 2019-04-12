class FlightsController < ApplicationController
  def index
    @flights = Flight.all
  end

  def show
    @flight = Flight.find(params[:id])
  end

  #create
  def new
  end

  def create
  end

  #update
  def edit
     @restaurant = Restaurant.find(params[:id])
  end

  def update

  end


  def destroy
    @flight = Flight.find(params[:id])
    @flight.destroy
  end

end
