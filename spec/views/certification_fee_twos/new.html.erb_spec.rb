require 'spec_helper'

describe "/certification_fee_twos/new.html.erb" do
  include CertificationFeeTwosHelper

  before(:each) do
    assigns[:certification_fee_two] = stub_model(CertificationFeeTwo,
      :new_record? => true,
      :kind => "value for kind",
      :description => "value for description",
      :active => false
    )
  end

  it "renders new certification_fee_two form" do
    render

    response.should have_tag("form[action=?][method=post]", certification_fee_twos_path) do
      with_tag("input#certification_fee_two_kind[name=?]", "certification_fee_two[kind]")
      with_tag("input#certification_fee_two_description[name=?]", "certification_fee_two[description]")
      with_tag("input#certification_fee_two_active[name=?]", "certification_fee_two[active]")
    end
  end
end
