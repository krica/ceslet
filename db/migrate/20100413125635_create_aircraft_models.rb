class CreateAircraftModels < ActiveRecord::Migration
  def self.up
    create_table :aircraft_models do |t|
      t.string :name
      t.string :tcds
      t.string :supplementary_indications
      t.string :mtow_kg
      t.string :speed_vno
      t.string :speed_vne
      t.string :speed_vmin
      t.string :original_regulation_basis
      t.string :number_of_passengers
      t.string :number_of_engines
      t.string :engine_type
      t.integer :aircraft_type_id

      t.timestamps
    end
  end

  def self.down
    drop_table :aircraft_models
  end
end
