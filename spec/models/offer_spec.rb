require 'spec_helper'

describe Offer do
  before(:each) do
    @valid_attributes = {
      :aircraft_id => 1,
      :order_number => "value for order_number",
      :responsible_person_bussiness => 1,
      :requirement_acceptance => Time.now,
      :handover_basis_ou => Time.now,
      :offer_verification_ou => Time.now,
      :basis_processer_id => 1,
      :classification_approval_id => 1,
      :basisi_approval_id => 1,
      :short_description => "value for short_description",
      :original_status => "value for original_status",
      :dismount_equipment_description => "value for dismount_equipment_description",
      :general_comments => "value for general_comments",
      :important_comments => "value for important_comments",
      :current_visibility => "value for current_visibility",
      :current_visibility_type => "value for current_visibility_type",
      :planned_visibility => "value for planned_visibility",
      :planned_visibility_type => "value for planned_visibility_type",
      :regulation_basis_id => 1,
      :classification_id => 1,
      :certification_fee_one_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Offer.create!(@valid_attributes)
  end
end
