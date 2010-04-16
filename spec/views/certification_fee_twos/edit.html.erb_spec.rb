require 'spec_helper'

describe "/certification_fee_twos/edit.html.erb" do
  include CertificationFeeTwosHelper

  before(:each) do
    assigns[:certification_fee_two] = @certification_fee_two = stub_model(CertificationFeeTwo,
      :new_record? => false,
      :kind => "value for kind",
      :description => "value for description",
      :active => false
    )
  end

  it "renders the edit certification_fee_two form" do
    render

    response.should have_tag("form[action=#{certification_fee_two_path(@certification_fee_two)}][method=post]") do
      with_tag('input#certification_fee_two_kind[name=?]', "certification_fee_two[kind]")
      with_tag('input#certification_fee_two_description[name=?]', "certification_fee_two[description]")
      with_tag('input#certification_fee_two_active[name=?]', "certification_fee_two[active]")
    end
  end
end
