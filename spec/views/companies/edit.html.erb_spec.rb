require 'spec_helper'

describe "/companies/edit.html.erb" do
  include CompaniesHelper

  before(:each) do
    assigns[:company] = @company = stub_model(Company,
      :new_record? => false,
      :name => "value for name",
      :ico => "value for ico",
      :dic => "value for dic"
    )
  end

  it "renders the edit company form" do
    render

    response.should have_tag("form[action=#{company_path(@company)}][method=post]") do
      with_tag('input#company_name[name=?]', "company[name]")
      with_tag('input#company_ico[name=?]', "company[ico]")
      with_tag('input#company_dic[name=?]', "company[dic]")
    end
  end
end
