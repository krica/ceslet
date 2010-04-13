require 'spec_helper'

describe "/aircraft_types/show.html.erb" do
  include AircraftTypesHelper
  before(:each) do
    assigns[:aircraft_type] = @aircraft_type = stub_model(AircraftType,
      :name => "value for name"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ name/)
  end
end
