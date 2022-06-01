class PassengerMailer < ApplicationMailer
  default from: 'bookings@flightbooker.com'

  def confirmation_email(passenger)
    @passenger = passenger

    mail(to: @passenger.email, subject: 'Your flight has been booked!')
  end
end
