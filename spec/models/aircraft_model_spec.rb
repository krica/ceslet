require 'spec_helper'

describe AircraftModel do
  before(:each) do
    @valid_attributes = {
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
    }
  end

  it "should create a new instance given valid attributes" do
    AircraftModel.create!(@valid_attributes)
  end
end
