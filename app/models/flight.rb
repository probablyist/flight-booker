class Flight < ApplicationRecord
  has_many :bookings, dependent: :destroy
  has_many :passengers, through: :bookings

  belongs_to :origin_airport, class_name: "Airport",
    foreign_key: "departure_id",
    inverse_of: :departing_flights
  belongs_to :destination_airport, class_name: "Airport",
    foreign_key: "arrival_id",
    inverse_of: :arriving_flights

  validates :departure_id, presence: true
  validates :arrival_id, presence: true
  validates :departure_time, presence: true
  validates :passenger_count, presence: true

  def self.options_for_select
    all.order(:departure_time).pluck(:departure_time).map(&:to_date).uniq
  end
end
