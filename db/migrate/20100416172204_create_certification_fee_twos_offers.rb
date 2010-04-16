class CreateCertificationFeeTwosOffers < ActiveRecord::Migration
  def self.up
		create_table :certification_fee_twos_offers, :id => false do |t|
        t.references :certification_fee_two
        t.references :offer
        t.timestamps
	end
  end

  def self.down
    drop_table :certification_fee_twos_offers
  end
end
