class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @selected_flight = Flight.find(params[:flight_id])
    @passenger_count = params[:passenger_count].to_i
    @passenger_count.times {@booking.passengers.build}
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      send_confirmation_emails(@booking)
      flash[:success] = "Successfully booked #{@booking.flight.airline} flight ##{@booking.flight.flight_number}!"
      redirect_to booking_path
    else
      flash[:error] = @booking.errors.full_messages.to_sentence
      redirect_back(fallback_location: root_path)
    end

  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, :passenger_count, passengers_attributes: [:name, :email])
  end
end
