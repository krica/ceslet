require 'spec_helper'

describe "/aircraft_types/index.html.erb" do
  include AircraftTypesHelper

  before(:each) do
    assigns[:aircraft_types] = [
      stub_model(AircraftType,
        :name => "value for name"
      ),
      stub_model(AircraftType,
        :name => "value for name"
      )
    ]
  end

  it "renders a list of aircraft_types" do
    render
    response.should have_tag("tr>td", "value for name".to_s, 2)
  end
end
