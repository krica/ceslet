require 'spec_helper'

describe "/is_logs/show.html.erb" do
  include IsLogsHelper
  before(:each) do
    assigns[:is_log] = @is_log = stub_model(IsLog,
      :event => "value for event",
      :user_id => 1
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ event/)
    response.should have_text(/1/)
  end
end
