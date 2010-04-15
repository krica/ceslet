require 'spec_helper'

describe RegulationBasesController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/regulation_bases" }.should route_to(:controller => "regulation_bases", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/regulation_bases/new" }.should route_to(:controller => "regulation_bases", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/regulation_bases/1" }.should route_to(:controller => "regulation_bases", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/regulation_bases/1/edit" }.should route_to(:controller => "regulation_bases", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/regulation_bases" }.should route_to(:controller => "regulation_bases", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/regulation_bases/1" }.should route_to(:controller => "regulation_bases", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/regulation_bases/1" }.should route_to(:controller => "regulation_bases", :action => "destroy", :id => "1") 
    end
  end
end
