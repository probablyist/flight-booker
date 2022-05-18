class Flight < ApplicationRecord
  belongs_to :origin_airport, class_name: "Airport",
    foreign_key: "departure_id",
    inverse_of: :departing_flights
  belongs_to :destination_airport, class_name: "Airport",
    foreign_key: "arrival_id",
    inverse_of: :arriving_flights
end
