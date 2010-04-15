require 'spec_helper'

describe Aircraft do
  before(:each) do
    @valid_attributes = {
      :serial_number => "value for serial_number",
      :matriculation => "value for matriculation",
      :active => false,
      :operator_id => 1,
      :owner_id => 
    }
  end

  it "should create a new instance given valid attributes" do
    Aircraft.create!(@valid_attributes)
  end
end
