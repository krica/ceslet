require 'spec_helper'

describe Classification do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :abbreviation => "value for abbreviation"
    }
  end

  it "should create a new instance given valid attributes" do
    Classification.create!(@valid_attributes)
  end
end
