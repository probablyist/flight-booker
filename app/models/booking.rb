class Booking < ApplicationRecord
  belongs_to :flight

  has_many :passengers, dependent: :destroy

  accepts_nested_attributes_for :passengers

  validates :flight_id, presence: true
  validates :passenger_count, presence: true
end
