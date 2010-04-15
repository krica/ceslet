require 'spec_helper'

describe Company do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :ico => "value for ico",
      :dic => "value for dic"
    }
  end

  it "should create a new instance given valid attributes" do
    Company.create!(@valid_attributes)
  end
end
