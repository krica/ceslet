class CreateAircrafts < ActiveRecord::Migration
  def self.up
    create_table :aircrafts do |t|
      t.string :serial_number
      t.string :matriculation
      t.boolean :active
      t.integer :operator_id
      t.integer :owner_id
	  t.integer :model_id

      t.timestamps
    end
  end

  def self.down
    drop_table :aircrafts
  end
end
