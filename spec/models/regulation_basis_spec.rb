require 'spec_helper'

describe RegulationBasis do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :mtow_kg => "value for mtow_kg"
    }
  end

  it "should create a new instance given valid attributes" do
    RegulationBasis.create!(@valid_attributes)
  end
end
