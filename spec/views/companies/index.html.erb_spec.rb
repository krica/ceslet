require 'spec_helper'

describe "/companies/index.html.erb" do
  include CompaniesHelper

  before(:each) do
    assigns[:companies] = [
      stub_model(Company,
        :name => "value for name",
        :ico => "value for ico",
        :dic => "value for dic"
      ),
      stub_model(Company,
        :name => "value for name",
        :ico => "value for ico",
        :dic => "value for dic"
      )
    ]
  end

  it "renders a list of companies" do
    render
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", "value for ico".to_s, 2)
    response.should have_tag("tr>td", "value for dic".to_s, 2)
  end
end
