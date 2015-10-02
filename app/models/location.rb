class Location < ActiveRecord::Base
  has_many :locations
  belongs_to :location

  has_many :al_associations
  has_many :action_pages, -> { uniq }, through: :al_associations
end
