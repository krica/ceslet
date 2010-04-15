class CreateCertificationFeeOnes < ActiveRecord::Migration
  def self.up
    create_table :certification_fee_ones do |t|
      t.string :mtow_kg
      t.string :type
      t.string :weight_category
      t.boolean :active

      t.timestamps
    end
  end

  def self.down
    drop_table :certification_fee_ones
  end
end
