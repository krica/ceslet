require 'spec_helper'

describe "/aircraft_models/new.html.erb" do
  include AircraftModelsHelper

  before(:each) do
    assigns[:aircraft_model] = stub_model(AircraftModel,
      :new_record? => true,
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

  it "renders new aircraft_model form" do
    render

    response.should have_tag("form[action=?][method=post]", aircraft_models_path) do
      with_tag("input#aircraft_model_name[name=?]", "aircraft_model[name]")
      with_tag("input#aircraft_model_tcds[name=?]", "aircraft_model[tcds]")
      with_tag("input#aircraft_model_supplementary_indications[name=?]", "aircraft_model[supplementary_indications]")
      with_tag("input#aircraft_model_mtow_kg[name=?]", "aircraft_model[mtow_kg]")
      with_tag("input#aircraft_model_speed_vno[name=?]", "aircraft_model[speed_vno]")
      with_tag("input#aircraft_model_speed_vne[name=?]", "aircraft_model[speed_vne]")
      with_tag("input#aircraft_model_speed_vmin[name=?]", "aircraft_model[speed_vmin]")
      with_tag("input#aircraft_model_original_regulation_basis[name=?]", "aircraft_model[original_regulation_basis]")
      with_tag("input#aircraft_model_number_of_passengers[name=?]", "aircraft_model[number_of_passengers]")
      with_tag("input#aircraft_model_number_of_engines[name=?]", "aircraft_model[number_of_engines]")
      with_tag("input#aircraft_model_engine_type[name=?]", "aircraft_model[engine_type]")
      with_tag("input#aircraft_model_aircraft_type_id[name=?]", "aircraft_model[aircraft_type_id]")
    end
  end
end
