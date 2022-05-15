# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Seed Airport Codes

Airport.destroy_all

Airport.create!([{
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
