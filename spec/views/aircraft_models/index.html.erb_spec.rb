require 'spec_helper'

describe "/aircraft_models/index.html.erb" do
  include AircraftModelsHelper

  before(:each) do
    assigns[:aircraft_models] = [
      stub_model(AircraftModel,
        :name => "value for name",
        :tcds => "value for tcds",
        :supplementary_indications => "value for supplementary_indications",
        :mtow_kg => "value for mtow_kg",
        :speed_vno => "value for speed_vno",
        :speed_vne => "value for speed_vne",
        :speed_vmin => "value for speed_vmin",
        :original_regulation_basis => "value for original_regulation_basis",
        :number_of_passengers => "value for number_of_passengers",
        :number_of_engines => "value for number_of_engines",
        :engine_type => "value for engine_type",
        :aircraft_type_id => 1
      ),
      stub_model(AircraftModel,
        :name => "value for name",
        :tcds => "value for tcds",
        :supplementary_indications => "value for supplementary_indications",
        :mtow_kg => "value for mtow_kg",
        :speed_vno => "value for speed_vno",
        :speed_vne => "value for speed_vne",
        :speed_vmin => "value for speed_vmin",
        :original_regulation_basis => "value for original_regulation_basis",
        :number_of_passengers => "value for number_of_passengers",
        :number_of_engines => "value for number_of_engines",
        :engine_type => "value for engine_type",
        :aircraft_type_id => 1
      )
    ]
  end

  it "renders a list of aircraft_models" do
    render
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", "value for tcds".to_s, 2)
    response.should have_tag("tr>td", "value for supplementary_indications".to_s, 2)
    response.should have_tag("tr>td", "value for mtow_kg".to_s, 2)
    response.should have_tag("tr>td", "value for speed_vno".to_s, 2)
    response.should have_tag("tr>td", "value for speed_vne".to_s, 2)
    response.should have_tag("tr>td", "value for speed_vmin".to_s, 2)
    response.should have_tag("tr>td", "value for original_regulation_basis".to_s, 2)
    response.should have_tag("tr>td", "value for number_of_passengers".to_s, 2)
    response.should have_tag("tr>td", "value for number_of_engines".to_s, 2)
    response.should have_tag("tr>td", "value for engine_type".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
  end
end
