require 'spec_helper'

describe "/classifications/show.html.erb" do
  include ClassificationsHelper
  before(:each) do
    assigns[:classification] = @classification = stub_model(Classification,
      :name => "value for name",
      :abbreviation => "value for abbreviation"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ name/)
    response.should have_text(/value\ for\ abbreviation/)
  end
end
