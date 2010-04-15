class AddValueToCertifacionFeeOne < ActiveRecord::Migration
  def self.up
	add_column :certification_fee_ones, :value, :string
  end

  def self.down
	remove_column :certification_fee_ones, :value
  end
end
