require 'spec_helper'

describe "/groups/edit.html.erb" do
  include GroupsHelper

  before(:each) do
    assigns[:group] = @group = stub_model(Group,
      :new_record? => false,
      :name => "value for name",
      :abbreviation => "value for abbreviation"
    )
  end

  it "renders the edit group form" do
    render

    response.should have_tag("form[action=#{group_path(@group)}][method=post]") do
      with_tag('input#group_name[name=?]', "group[name]")
      with_tag('input#group_abbreviation[name=?]', "group[abbreviation]")
    end
  end
end
