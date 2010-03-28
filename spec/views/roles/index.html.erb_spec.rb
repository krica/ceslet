require 'spec_helper'

describe "/roles/index.html.erb" do
  include RolesHelper

  before(:each) do
    assigns[:roles] = [
      stub_model(Role,
        :name => "value for name"
      ),
      stub_model(Role,
        :name => "value for name"
      )
    ]
  end

  it "renders a list of roles" do
    render
    response.should have_tag("tr>td", "value for name".to_s, 2)
  end
end
