require 'spec_helper'

describe CertificationFeeOne do
  before(:each) do
    @valid_attributes = {
      :mtow_kg => "value for mtow_kg",
      :type => "value for type",
      :weight_category => "value for weight_category",
      :active => false
    }
  end

  it "should create a new instance given valid attributes" do
    CertificationFeeOne.create!(@valid_attributes)
  end
end
