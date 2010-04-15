require 'spec_helper'

describe "/aircrafts/edit.html.erb" do
  include AircraftsHelper

  before(:each) do
    assigns[:aircraft] = @aircraft = stub_model(Aircraft,
      :new_record? => false,
      :serial_number => "value for serial_number",
      :matriculation => "value for matriculation",
      :active => false,
      :operator_id => 1,
      :owner_id => 
    )
  end

  it "renders the edit aircraft form" do
    render

    response.should have_tag("form[action=#{aircraft_path(@aircraft)}][method=post]") do
      with_tag('input#aircraft_serial_number[name=?]', "aircraft[serial_number]")
      with_tag('input#aircraft_matriculation[name=?]', "aircraft[matriculation]")
      with_tag('input#aircraft_active[name=?]', "aircraft[active]")
      with_tag('input#aircraft_operator_id[name=?]', "aircraft[operator_id]")
      with_tag('input#aircraft_owner_id[name=?]', "aircraft[owner_id]")
    end
  end
end
