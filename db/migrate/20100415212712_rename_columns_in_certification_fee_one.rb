class RenameColumnsInCertificationFeeOne < ActiveRecord::Migration
  def self.up
	add_column :certification_fee_ones, :fee_type, :string
	add_column :certification_fee_ones, :kind, :string
	remove_column :certification_fee_ones, :type
	remove_column :certification_fee_ones, :weight_category
  end

  def self.down
	add_column :certification_fee_ones, :weight_category, :string
	add_column :certification_fee_ones, :type, :string
	remove_column :certification_fee_ones, :fee_type
	remove_column :certification_fee_ones, :kind
  end
end
