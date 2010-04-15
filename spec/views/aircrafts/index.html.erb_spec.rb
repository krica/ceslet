require 'spec_helper'

describe "/aircrafts/index.html.erb" do
  include AircraftsHelper

  before(:each) do
    assigns[:aircrafts] = [
      stub_model(Aircraft,
        :serial_number => "value for serial_number",
        :matriculation => "value for matriculation",
        :active => false,
        :operator_id => 1,
        :owner_id => 
      ),
      stub_model(Aircraft,
        :serial_number => "value for serial_number",
        :matriculation => "value for matriculation",
        :active => false,
        :operator_id => 1,
        :owner_id => 
      )
    ]
  end

  it "renders a list of aircrafts" do
    render
    response.should have_tag("tr>td", "value for serial_number".to_s, 2)
    response.should have_tag("tr>td", "value for matriculation".to_s, 2)
    response.should have_tag("tr>td", false.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", .to_s, 2)
  end
end
