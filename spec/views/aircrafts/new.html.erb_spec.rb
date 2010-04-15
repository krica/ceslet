require 'spec_helper'

describe "/aircrafts/new.html.erb" do
  include AircraftsHelper

  before(:each) do
    assigns[:aircraft] = stub_model(Aircraft,
      :new_record? => true,
      :serial_number => "value for serial_number",
      :matriculation => "value for matriculation",
      :active => false,
      :operator_id => 1,
      :owner_id => 
    )
  end

  it "renders new aircraft form" do
    render

    response.should have_tag("form[action=?][method=post]", aircrafts_path) do
      with_tag("input#aircraft_serial_number[name=?]", "aircraft[serial_number]")
      with_tag("input#aircraft_matriculation[name=?]", "aircraft[matriculation]")
      with_tag("input#aircraft_active[name=?]", "aircraft[active]")
      with_tag("input#aircraft_operator_id[name=?]", "aircraft[operator_id]")
      with_tag("input#aircraft_owner_id[name=?]", "aircraft[owner_id]")
    end
  end
end
