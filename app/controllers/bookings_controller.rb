class BookingsController < ApplicationController
  def new
    @flight = Flight.find(params[:flight_id])
    @booking = Booking.new
    number_of_passengers = params[:number_of_passengers].to_i
    number_of_passengers.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.new(booking_params)
    @flight = Flight.find(params[:booking][:flight_id])

    if @booking.save
      flash[:success] = "Succesfully booked the #{'ticket'.pluralize(@booking.passengers.count)}!"
      send_mail
      redirect_to @booking
    else
      render 'new'
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: %i[id name email])
  end

  def send_mail
    @booking.passengers.each do |passenger|
      PassengerMailer.thank_you(passenger).deliver_now
    end
  end
end
