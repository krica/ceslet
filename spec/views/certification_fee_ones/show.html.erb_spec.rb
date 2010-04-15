require 'spec_helper'

describe "/certification_fee_ones/show.html.erb" do
  include CertificationFeeOnesHelper
  before(:each) do
    assigns[:certification_fee_one] = @certification_fee_one = stub_model(CertificationFeeOne,
      :mtow_kg => "value for mtow_kg",
      :type => "value for type",
      :weight_category => "value for weight_category",
      :active => false
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ mtow_kg/)
    response.should have_text(/value\ for\ type/)
    response.should have_text(/value\ for\ weight_category/)
    response.should have_text(/false/)
  end
end
