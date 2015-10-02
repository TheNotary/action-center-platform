# ActionPage Location Association (through table)
class AlAssociation < ActiveRecord::Base
  belongs_to :action_page
  belongs_to :location
end
