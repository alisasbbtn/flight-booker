class PassengerMailer < ApplicationMailer
  default from: 'example@example.com'
  helper FlightsHelper
  def thank_you(passenger)
    @passenger = passenger
    @flight = @passenger.booking.flight
    mail(to: @passenger.email, subject: 'Thank you for booking!')
  end
end
