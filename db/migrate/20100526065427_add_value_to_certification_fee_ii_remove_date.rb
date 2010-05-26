class AddValueToCertificationFeeIiRemoveDate < ActiveRecord::Migration
  def self.up
	add_column :certification_fee_twos, :value, :string
	remove_column :certification_fee_twos, :date
  end

  def self.down
	add_column :certification_fee_twos, :date, :string
	remove_column :certification_fee_twos, :value
  end
end
