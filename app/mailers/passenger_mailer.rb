class PassengerMailer < ApplicationMailer
  default from: 'example@example.com'

  def thank_you(passenger)
    @passenger = passenger
    @booking = @passenger.booking
    mail(to: @passenger.email, subject: 'Thank you for booking!')
  end
end
