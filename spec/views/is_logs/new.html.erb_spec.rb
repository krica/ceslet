require 'spec_helper'

describe "/is_logs/new.html.erb" do
  include IsLogsHelper

  before(:each) do
    assigns[:is_log] = stub_model(IsLog,
      :new_record? => true,
      :event => "value for event",
      :user_id => 1
    )
  end

  it "renders new is_log form" do
    render

    response.should have_tag("form[action=?][method=post]", is_logs_path) do
      with_tag("input#is_log_event[name=?]", "is_log[event]")
      with_tag("input#is_log_user_id[name=?]", "is_log[user_id]")
    end
  end
end
