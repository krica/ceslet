require 'spec_helper'

describe "/companies/show.html.erb" do
  include CompaniesHelper
  before(:each) do
    assigns[:company] = @company = stub_model(Company,
      :name => "value for name",
      :ico => "value for ico",
      :dic => "value for dic"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ name/)
    response.should have_text(/value\ for\ ico/)
    response.should have_text(/value\ for\ dic/)
  end
end
