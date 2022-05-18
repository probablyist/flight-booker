class FlightsController < ApplicationController
  # before_action :set_flight, only: %i[ show edit update destroy ]

  # GET /flights or /flights.json
  def index
    @airport_options = Airport.all.map { |u| u.city, u.id }
    return if flight_params.empty?
  end

  # GET /flights/1 or /flights/1.json
  # def show
  # end

  private
    # Only allow a list of trusted parameters through.
    def flight_params
      params.require(:flight).permit(:departure_id, :arrival_id, :departure_time, :duration)
    end
end
