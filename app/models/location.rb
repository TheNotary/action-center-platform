class Location < ActiveRecord::Base
  has_many :locations
  belongs_to :location
  
end
