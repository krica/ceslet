require 'spec_helper'

describe "/classifications/edit.html.erb" do
  include ClassificationsHelper

  before(:each) do
    assigns[:classification] = @classification = stub_model(Classification,
      :new_record? => false,
      :name => "value for name",
      :abbreviation => "value for abbreviation"
    )
  end

  it "renders the edit classification form" do
    render

    response.should have_tag("form[action=#{classification_path(@classification)}][method=post]") do
      with_tag('input#classification_name[name=?]', "classification[name]")
      with_tag('input#classification_abbreviation[name=?]', "classification[abbreviation]")
    end
  end
end
