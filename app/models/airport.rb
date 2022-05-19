class Airport < ApplicationRecord
  has_many :arriving_flights, class_name: "Flight",
    foreign_key: "arrival_id",
    dependent: :destroy,
    inverse_of: :destination_airport
  has_many :departing_flights, class_name: "Flight",
    foreign_key: "departure_id",
    dependent: :destroy,
    inverse_of: :origin_airport

  def self.options_for_select
    all.pluck(:city, :id)
  end
end
