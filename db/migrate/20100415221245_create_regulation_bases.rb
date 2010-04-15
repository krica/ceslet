class CreateRegulationBases < ActiveRecord::Migration
  def self.up
    create_table :regulation_bases do |t|
      t.string :name
      t.string :mtow_kg

      t.timestamps
    end
  end

  def self.down
    drop_table :regulation_bases
  end
end
