require 'spec_helper'

describe "/companies/new.html.erb" do
  include CompaniesHelper

  before(:each) do
    assigns[:company] = stub_model(Company,
      :new_record? => true,
      :name => "value for name",
      :ico => "value for ico",
      :dic => "value for dic"
    )
  end

  it "renders new company form" do
    render

    response.should have_tag("form[action=?][method=post]", companies_path) do
      with_tag("input#company_name[name=?]", "company[name]")
      with_tag("input#company_ico[name=?]", "company[ico]")
      with_tag("input#company_dic[name=?]", "company[dic]")
    end
  end
end
