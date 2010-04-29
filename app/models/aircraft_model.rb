class AircraftModel < ActiveRecord::Base

  belongs_to :aircraft_type

  validates_presence_of :name
  validates_presence_of :aircraft_type_id
end
