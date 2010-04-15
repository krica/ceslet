require 'spec_helper'

describe "/classifications/new.html.erb" do
  include ClassificationsHelper

  before(:each) do
    assigns[:classification] = stub_model(Classification,
      :new_record? => true,
      :name => "value for name",
      :abbreviation => "value for abbreviation"
    )
  end

  it "renders new classification form" do
    render

    response.should have_tag("form[action=?][method=post]", classifications_path) do
      with_tag("input#classification_name[name=?]", "classification[name]")
      with_tag("input#classification_abbreviation[name=?]", "classification[abbreviation]")
    end
  end
end
