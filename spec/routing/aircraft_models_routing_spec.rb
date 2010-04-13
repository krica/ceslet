require 'spec_helper'

describe AircraftModelsController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/aircraft_models" }.should route_to(:controller => "aircraft_models", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/aircraft_models/new" }.should route_to(:controller => "aircraft_models", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/aircraft_models/1" }.should route_to(:controller => "aircraft_models", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/aircraft_models/1/edit" }.should route_to(:controller => "aircraft_models", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/aircraft_models" }.should route_to(:controller => "aircraft_models", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/aircraft_models/1" }.should route_to(:controller => "aircraft_models", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/aircraft_models/1" }.should route_to(:controller => "aircraft_models", :action => "destroy", :id => "1") 
    end
  end
end
