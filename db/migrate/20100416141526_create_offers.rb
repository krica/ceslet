class CreateOffers < ActiveRecord::Migration
  def self.up
    create_table :offers do |t|
      t.integer :aircraft_id
      t.string :order_number
      t.integer :responsible_person_bussiness
      t.datetime :requirement_acceptance
      t.datetime :handover_basis_ou
      t.datetime :offer_verification_ou
      t.integer :basis_processer_id
      t.integer :classification_approval_id
      t.integer :basisi_approval_id
      t.string :short_description
      t.string :original_status
      t.string :dismount_equipment_description
      t.string :general_comments
      t.string :important_comments
      t.string :current_visibility
      t.string :current_visibility_type
      t.string :planned_visibility
      t.string :planned_visibility_type
      t.integer :regulation_basis_id
      t.integer :classification_id
      t.integer :certification_fee_one_id

      t.timestamps
    end
  end

  def self.down
    drop_table :offers
  end
end
