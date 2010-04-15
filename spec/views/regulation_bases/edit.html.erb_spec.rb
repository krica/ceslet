require 'spec_helper'

describe "/regulation_bases/edit.html.erb" do
  include RegulationBasesHelper

  before(:each) do
    assigns[:regulation_basis] = @regulation_basis = stub_model(RegulationBasis,
      :new_record? => false,
      :name => "value for name",
      :mtow_kg => "value for mtow_kg"
    )
  end

  it "renders the edit regulation_basis form" do
    render

    response.should have_tag("form[action=#{regulation_basis_path(@regulation_basis)}][method=post]") do
      with_tag('input#regulation_basis_name[name=?]', "regulation_basis[name]")
      with_tag('input#regulation_basis_mtow_kg[name=?]', "regulation_basis[mtow_kg]")
    end
  end
end
