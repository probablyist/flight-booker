class FlightsController < ApplicationController
  # before_action :set_flight, only: %i[ show edit update destroy ]

  # GET /flights or /flights.json
  def index
    @airport_options = Airport.all.map { |u| [u.city, u.id] }
    @flight_times = available_flights
    return if flight_params.empty?
  end

  # Lists all flights
  def flights
    Flight.all.order(:departure_time)
  end
  #Flight.all.map { |u| [u.departure_time, u.departure_id] }


  def available_flights
    return [] unless params[:departure_id].present?

    date = params[:departure_time].strftime("%m/%d/%Y")
    flights.where(departure_id: params[:departure_id], arrival_id: params[:arrival_id], departure_time:  within_selected_date(date))
  end

  def within_selected_date(date)
    return unless date.present?

    DateTime.new(date.year, date.month, date.day).all_day
  end

  # def departure_time_formated
  #   departure_time.strftime("%m/%d/%Y")
  # end


  private
    # Only allow a list of trusted parameters through.
    def flight_params
      params.permit(:departure_id, :arrival_id, :departure_time, :duration)
    end
end
