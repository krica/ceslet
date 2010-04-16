require 'spec_helper'

describe "/offers/index.html.erb" do
  include OffersHelper

  before(:each) do
    assigns[:offers] = [
      stub_model(Offer,
        :aircraft_id => 1,
        :order_number => "value for order_number",
        :responsible_person_bussiness => 1,
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
      ),
      stub_model(Offer,
        :aircraft_id => 1,
        :order_number => "value for order_number",
        :responsible_person_bussiness => 1,
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
      )
    ]
  end

  it "renders a list of offers" do
    render
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", "value for order_number".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", "value for short_description".to_s, 2)
    response.should have_tag("tr>td", "value for original_status".to_s, 2)
    response.should have_tag("tr>td", "value for dismount_equipment_description".to_s, 2)
    response.should have_tag("tr>td", "value for general_comments".to_s, 2)
    response.should have_tag("tr>td", "value for important_comments".to_s, 2)
    response.should have_tag("tr>td", "value for current_visibility".to_s, 2)
    response.should have_tag("tr>td", "value for current_visibility_type".to_s, 2)
    response.should have_tag("tr>td", "value for planned_visibility".to_s, 2)
    response.should have_tag("tr>td", "value for planned_visibility_type".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
  end
end
