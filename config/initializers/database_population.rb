
def populate_locations
  Location.delete_all

  global = Location.create(name: "global", location_type: "global")

  global.locations.create(name: "United States")
  global.locations.create(name: "International")
end
