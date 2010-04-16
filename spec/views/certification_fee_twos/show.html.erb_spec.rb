require 'spec_helper'

describe "/certification_fee_twos/show.html.erb" do
  include CertificationFeeTwosHelper
  before(:each) do
    assigns[:certification_fee_two] = @certification_fee_two = stub_model(CertificationFeeTwo,
      :kind => "value for kind",
      :description => "value for description",
      :active => false
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ kind/)
    response.should have_text(/value\ for\ description/)
    response.should have_text(/false/)
  end
end
