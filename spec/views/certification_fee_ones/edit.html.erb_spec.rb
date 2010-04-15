require 'spec_helper'

describe "/certification_fee_ones/edit.html.erb" do
  include CertificationFeeOnesHelper

  before(:each) do
    assigns[:certification_fee_one] = @certification_fee_one = stub_model(CertificationFeeOne,
      :new_record? => false,
      :mtow_kg => "value for mtow_kg",
      :type => "value for type",
      :weight_category => "value for weight_category",
      :active => false
    )
  end

  it "renders the edit certification_fee_one form" do
    render

    response.should have_tag("form[action=#{certification_fee_one_path(@certification_fee_one)}][method=post]") do
      with_tag('input#certification_fee_one_mtow_kg[name=?]', "certification_fee_one[mtow_kg]")
      with_tag('input#certification_fee_one_type[name=?]', "certification_fee_one[type]")
      with_tag('input#certification_fee_one_weight_category[name=?]', "certification_fee_one[weight_category]")
      with_tag('input#certification_fee_one_active[name=?]', "certification_fee_one[active]")
    end
  end
end
