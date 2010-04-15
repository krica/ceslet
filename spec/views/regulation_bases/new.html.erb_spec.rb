require 'spec_helper'

describe "/regulation_bases/new.html.erb" do
  include RegulationBasesHelper

  before(:each) do
    assigns[:regulation_basis] = stub_model(RegulationBasis,
      :new_record? => true,
      :name => "value for name",
      :mtow_kg => "value for mtow_kg"
    )
  end

  it "renders new regulation_basis form" do
    render

    response.should have_tag("form[action=?][method=post]", regulation_bases_path) do
      with_tag("input#regulation_basis_name[name=?]", "regulation_basis[name]")
      with_tag("input#regulation_basis_mtow_kg[name=?]", "regulation_basis[mtow_kg]")
    end
  end
end
