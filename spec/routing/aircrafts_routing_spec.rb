require 'spec_helper'

describe AircraftsController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/aircrafts" }.should route_to(:controller => "aircrafts", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/aircrafts/new" }.should route_to(:controller => "aircrafts", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/aircrafts/1" }.should route_to(:controller => "aircrafts", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/aircrafts/1/edit" }.should route_to(:controller => "aircrafts", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/aircrafts" }.should route_to(:controller => "aircrafts", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/aircrafts/1" }.should route_to(:controller => "aircrafts", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/aircrafts/1" }.should route_to(:controller => "aircrafts", :action => "destroy", :id => "1") 
    end
  end
end
