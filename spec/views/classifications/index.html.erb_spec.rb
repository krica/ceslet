require 'spec_helper'

describe "/classifications/index.html.erb" do
  include ClassificationsHelper

  before(:each) do
    assigns[:classifications] = [
      stub_model(Classification,
        :name => "value for name",
        :abbreviation => "value for abbreviation"
      ),
      stub_model(Classification,
        :name => "value for name",
        :abbreviation => "value for abbreviation"
      )
    ]
  end

  it "renders a list of classifications" do
    render
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", "value for abbreviation".to_s, 2)
  end
end
