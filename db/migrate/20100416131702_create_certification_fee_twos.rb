class CreateCertificationFeeTwos < ActiveRecord::Migration
  def self.up
    create_table :certification_fee_twos do |t|
      t.string :kind
      t.string :description
      t.datetime :date
      t.boolean :active

      t.timestamps
    end
  end

  def self.down
    drop_table :certification_fee_twos
  end
end
