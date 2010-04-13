class CreateAircraftTypes < ActiveRecord::Migration
  def self.up
    create_table :aircraft_types do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :aircraft_types
  end
end
