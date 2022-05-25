module FlightsHelper
  def show_selected_airport(location_id)
    airport = Airport.find(location_id)
    "#{airport.city}, #{airport.state}"
  end

  def short_time_format(flight)
    flight.departure_time.strftime('%l:%M %p')
  end

  def short_date_format(flight)
    flight.departure_time.to_date.strftime('%Y-%m-%d')
  end

  def duration_formatted(flight)
    duration = flight.duration

    hours = duration / 60
    minutes = duration % 60
    "#{hours}hr #{minutes}min"
  end
end
