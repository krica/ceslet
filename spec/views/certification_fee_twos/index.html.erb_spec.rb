require 'spec_helper'

describe "/certification_fee_twos/index.html.erb" do
  include CertificationFeeTwosHelper

  before(:each) do
    assigns[:certification_fee_twos] = [
      stub_model(CertificationFeeTwo,
        :kind => "value for kind",
        :description => "value for description",
        :active => false
      ),
      stub_model(CertificationFeeTwo,
        :kind => "value for kind",
        :description => "value for description",
        :active => false
      )
    ]
  end

  it "renders a list of certification_fee_twos" do
    render
    response.should have_tag("tr>td", "value for kind".to_s, 2)
    response.should have_tag("tr>td", "value for description".to_s, 2)
    response.should have_tag("tr>td", false.to_s, 2)
  end
end
