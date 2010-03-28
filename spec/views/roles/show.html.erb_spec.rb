require 'spec_helper'

describe "/roles/show.html.erb" do
  include RolesHelper
  before(:each) do
    assigns[:role] = @role = stub_model(Role,
      :name => "value for name"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ name/)
  end
end
