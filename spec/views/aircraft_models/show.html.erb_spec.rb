require 'spec_helper'

describe "/aircraft_models/show.html.erb" do
  include AircraftModelsHelper
  before(:each) do
    assigns[:aircraft_model] = @aircraft_model = stub_model(AircraftModel,
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
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ name/)
    response.should have_text(/value\ for\ tcds/)
    response.should have_text(/value\ for\ supplementary_indications/)
    response.should have_text(/value\ for\ mtow_kg/)
    response.should have_text(/value\ for\ speed_vno/)
    response.should have_text(/value\ for\ speed_vne/)
    response.should have_text(/value\ for\ speed_vmin/)
    response.should have_text(/value\ for\ original_regulation_basis/)
    response.should have_text(/value\ for\ number_of_passengers/)
    response.should have_text(/value\ for\ number_of_engines/)
    response.should have_text(/value\ for\ engine_type/)
    response.should have_text(/1/)
  end
end
