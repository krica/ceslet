require 'spec_helper'

describe "/aircraft_types/new.html.erb" do
  include AircraftTypesHelper

  before(:each) do
    assigns[:aircraft_type] = stub_model(AircraftType,
      :new_record? => true,
      :name => "value for name"
    )
  end

  it "renders new aircraft_type form" do
    render

    response.should have_tag("form[action=?][method=post]", aircraft_types_path) do
      with_tag("input#aircraft_type_name[name=?]", "aircraft_type[name]")
    end
  end
end
