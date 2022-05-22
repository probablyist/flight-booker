# Seed Airport Codes

Airport.destroy_all

airports = Airport.create!([{
  code: "ANC",
  city: "Anchorage",
  state: "AK"
},
{
  code: "DEN",
  city: "Denver",
  state: "CO"
},
{
  code: "HLN",
  city: "Honolulu",
  state: "HI"
},
{
  code: "BOS",
  city: "Boston",
  state: "MA"
},
{
  code: "FAR",
  city: "Fargo",
  state: "ND"
}])

# Seed Flights

Flight.destroy_all

flights = Flight.create!([{
  departure_id: airports.first.id,
  arrival_id: airports.second.id,
  departure_time: "2022-12-24 07:00:00",
  duration: 500
},
{
  departure_id: airports.second.id,
  arrival_id: airports.third.id,
  departure_time: "2022-12-04 07:35:00",
  duration: 420
},
{
  departure_id: airports.fourth.id,
  arrival_id: airports.last.id,
  departure_time: "2022-12-14 10:00:00",
  duration: 360
},
{
  departure_id: airports.third.id,
  arrival_id: airports.second.id,
  departure_time: "2023-01-04 14:00:00",
  duration: 450
},
{
  departure_id: airports.first.id,
  arrival_id: airports.last.id,
  departure_time: "2023-10-24 11:00:00",
  duration: 730
},
{
  departure_id: airports.second.id,
  arrival_id: airports.fourth.id,
  departure_time: "2023-12-27 07:00:00",
  duration: 385
}])
