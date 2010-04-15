require 'spec_helper'

describe "/aircrafts/show.html.erb" do
  include AircraftsHelper
  before(:each) do
    assigns[:aircraft] = @aircraft = stub_model(Aircraft,
      :serial_number => "value for serial_number",
      :matriculation => "value for matriculation",
      :active => false,
      :operator_id => 1,
      :owner_id => 
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ serial_number/)
    response.should have_text(/value\ for\ matriculation/)
    response.should have_text(/false/)
    response.should have_text(/1/)
    response.should have_text(//)
  end
end
