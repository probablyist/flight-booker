class FlightsController < ApplicationController
  # before_action :set_flight, only: %i[ show edit update destroy ]

  # GET /flights or /flights.json
  def index
    # @airport_options = Airport.all.map { |u| [u.city, u.id] }
    @flight_times = available_flights
    return if flight_params.empty?
  end

  private
   # Lists all flights
   def flights
    Flight.all.order(:departure_time)
  end

  def available_flights
    return [] unless params[:departure_id].present?

    date = params[:departure_time].to_datetime
    flights.where(
      departure_id: params[:departure_id],
      arrival_id: params[:arrival_id],
      departure_time:  within_selected_date(date)
    )
  end

  def within_selected_date(date)
    return unless date.present?

    DateTime.new(date.year, date.month, date.day).all_day
  end

    # Only allow a list of trusted parameters through.
    def flight_params
      params.permit(:departure_id, :arrival_id, :departure_time, :duration, :passenger_count)
    end
end
