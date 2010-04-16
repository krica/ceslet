require 'spec_helper'

describe "/offers/edit.html.erb" do
  include OffersHelper

  before(:each) do
    assigns[:offer] = @offer = stub_model(Offer,
      :new_record? => false,
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

  it "renders the edit offer form" do
    render

    response.should have_tag("form[action=#{offer_path(@offer)}][method=post]") do
      with_tag('input#offer_aircraft_id[name=?]', "offer[aircraft_id]")
      with_tag('input#offer_order_number[name=?]', "offer[order_number]")
      with_tag('input#offer_responsible_person_bussiness[name=?]', "offer[responsible_person_bussiness]")
      with_tag('input#offer_basis_processer_id[name=?]', "offer[basis_processer_id]")
      with_tag('input#offer_classification_approval_id[name=?]', "offer[classification_approval_id]")
      with_tag('input#offer_basisi_approval_id[name=?]', "offer[basisi_approval_id]")
      with_tag('input#offer_short_description[name=?]', "offer[short_description]")
      with_tag('input#offer_original_status[name=?]', "offer[original_status]")
      with_tag('input#offer_dismount_equipment_description[name=?]', "offer[dismount_equipment_description]")
      with_tag('input#offer_general_comments[name=?]', "offer[general_comments]")
      with_tag('input#offer_important_comments[name=?]', "offer[important_comments]")
      with_tag('input#offer_current_visibility[name=?]', "offer[current_visibility]")
      with_tag('input#offer_current_visibility_type[name=?]', "offer[current_visibility_type]")
      with_tag('input#offer_planned_visibility[name=?]', "offer[planned_visibility]")
      with_tag('input#offer_planned_visibility_type[name=?]', "offer[planned_visibility_type]")
      with_tag('input#offer_regulation_basis_id[name=?]', "offer[regulation_basis_id]")
      with_tag('input#offer_classification_id[name=?]', "offer[classification_id]")
      with_tag('input#offer_certification_fee_one_id[name=?]', "offer[certification_fee_one_id]")
    end
  end
end
