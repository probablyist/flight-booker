module FlightsHelper
  def show_selected_airport(location_id)
    Airport.find(location_id).city
  end
end
