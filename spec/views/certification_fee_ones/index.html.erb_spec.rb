require 'spec_helper'

describe "/certification_fee_ones/index.html.erb" do
  include CertificationFeeOnesHelper

  before(:each) do
    assigns[:certification_fee_ones] = [
      stub_model(CertificationFeeOne,
        :mtow_kg => "value for mtow_kg",
        :type => "value for type",
        :weight_category => "value for weight_category",
        :active => false
      ),
      stub_model(CertificationFeeOne,
        :mtow_kg => "value for mtow_kg",
        :type => "value for type",
        :weight_category => "value for weight_category",
        :active => false
      )
    ]
  end

  it "renders a list of certification_fee_ones" do
    render
    response.should have_tag("tr>td", "value for mtow_kg".to_s, 2)
    response.should have_tag("tr>td", "value for type".to_s, 2)
    response.should have_tag("tr>td", "value for weight_category".to_s, 2)
    response.should have_tag("tr>td", false.to_s, 2)
  end
end
