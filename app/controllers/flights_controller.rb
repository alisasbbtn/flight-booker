class FlightsController < ApplicationController
  def index
    @airports = Airport.all
    @avaliable_dates = Flight.avaliable_dates

    @from = params[:from]
    @to = params[:to]
    @date = params[:date]
    @number_of_passengers = params[:number_of_passengers]

    if params[:commit]
      @flights = Flight.avaliable_flights(@from, @to, @date)
      if @flights.empty?
        flash.now[:danger] = "No avaliable flights."
        @flights = nil
      end
    end
  end
end
