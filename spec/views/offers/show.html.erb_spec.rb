require 'spec_helper'

describe "/offers/show.html.erb" do
  include OffersHelper
  before(:each) do
    assigns[:offer] = @offer = stub_model(Offer,
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
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/1/)
    response.should have_text(/value\ for\ order_number/)
    response.should have_text(/1/)
    response.should have_text(/1/)
    response.should have_text(/1/)
    response.should have_text(/1/)
    response.should have_text(/value\ for\ short_description/)
    response.should have_text(/value\ for\ original_status/)
    response.should have_text(/value\ for\ dismount_equipment_description/)
    response.should have_text(/value\ for\ general_comments/)
    response.should have_text(/value\ for\ important_comments/)
    response.should have_text(/value\ for\ current_visibility/)
    response.should have_text(/value\ for\ current_visibility_type/)
    response.should have_text(/value\ for\ planned_visibility/)
    response.should have_text(/value\ for\ planned_visibility_type/)
    response.should have_text(/1/)
    response.should have_text(/1/)
    response.should have_text(/1/)
  end
end
