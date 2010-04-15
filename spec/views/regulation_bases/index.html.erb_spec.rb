require 'spec_helper'

describe "/regulation_bases/index.html.erb" do
  include RegulationBasesHelper

  before(:each) do
    assigns[:regulation_bases] = [
      stub_model(RegulationBasis,
        :name => "value for name",
        :mtow_kg => "value for mtow_kg"
      ),
      stub_model(RegulationBasis,
        :name => "value for name",
        :mtow_kg => "value for mtow_kg"
      )
    ]
  end

  it "renders a list of regulation_bases" do
    render
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", "value for mtow_kg".to_s, 2)
  end
end
