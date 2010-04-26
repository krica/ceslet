require 'spec_helper'

describe "/is_logs/index.html.erb" do
  include IsLogsHelper

  before(:each) do
    assigns[:is_logs] = [
      stub_model(IsLog,
        :event => "value for event",
        :user_id => 1
      ),
      stub_model(IsLog,
        :event => "value for event",
        :user_id => 1
      )
    ]
  end

  it "renders a list of is_logs" do
    render
    response.should have_tag("tr>td", "value for event".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
  end
end
