
def populate_locations
  Location.delete_all

  global = Location.create(name: "global", location_type: "organizational")

  us = global.locations.create(name: "United States", location_type: "nation")

  us.locations.create(name: "California", symbol: "Ca", location_type: "state")
  us.locations.create(name: "Illinois", symbol: "Il", location_type: "state")
  us.locations.create(name: "New York", symbol: "Ny", location_type: "state")
  us.locations.create(name: "District of Columbia", symbol: "Dc", location_type: "thingy")

  international = global.locations.create(name: "International", location_type: "organizational")

  international.locations.create(name: "Germany", symbol: "DEU", location_type: "nation")
  international.locations.create(name: "Australia", symbol: "AUS", location_type: "nation")
  international.locations.create(name: "United Kingdom", symbol: "GBR", location_type: "nation")
  international.locations.create(name: "Russia", symbol: "RUS", location_type: "nation")
end
