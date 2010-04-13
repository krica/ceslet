require 'spec_helper'

describe "/aircraft_types/edit.html.erb" do
  include AircraftTypesHelper

  before(:each) do
    assigns[:aircraft_type] = @aircraft_type = stub_model(AircraftType,
      :new_record? => false,
      :name => "value for name"
    )
  end

  it "renders the edit aircraft_type form" do
    render

    response.should have_tag("form[action=#{aircraft_type_path(@aircraft_type)}][method=post]") do
      with_tag('input#aircraft_type_name[name=?]', "aircraft_type[name]")
    end
  end
end
