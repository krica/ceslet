class RegulationBasis < ActiveRecord::Base

  validates_presence_of :name
  validates_presence_of :mtow_kg 
end
