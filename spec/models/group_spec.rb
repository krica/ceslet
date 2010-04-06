require 'spec_helper'

describe Group do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :abbreviation => "value for abbreviation"
    }
  end

  it "should create a new instance given valid attributes" do
    Group.create!(@valid_attributes)
  end
end
