class AddAircraftModelIdToAircraft < ActiveRecord::Migration
  def self.up
	add_column :aircrafts, :aircraft_model_id, :integer
	remove_column :aircrafts, :model_id
  end

  def self.down
	add_column :aircrafts, :model_id, :integer
	remove_column :aircrafts, :aircraft_model_id
  end
end
