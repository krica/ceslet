require 'spec_helper'

describe CertificationFeeTwo do
  before(:each) do
    @valid_attributes = {
      :kind => "value for kind",
      :description => "value for description",
      :date => Time.now,
      :active => false
    }
  end

  it "should create a new instance given valid attributes" do
    CertificationFeeTwo.create!(@valid_attributes)
  end
end
