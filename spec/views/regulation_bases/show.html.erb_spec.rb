require 'spec_helper'

describe "/regulation_bases/show.html.erb" do
  include RegulationBasesHelper
  before(:each) do
    assigns[:regulation_basis] = @regulation_basis = stub_model(RegulationBasis,
      :name => "value for name",
      :mtow_kg => "value for mtow_kg"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ name/)
    response.should have_text(/value\ for\ mtow_kg/)
  end
end
