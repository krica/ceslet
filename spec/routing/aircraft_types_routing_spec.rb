require 'spec_helper'

describe AircraftTypesController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/aircraft_types" }.should route_to(:controller => "aircraft_types", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/aircraft_types/new" }.should route_to(:controller => "aircraft_types", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/aircraft_types/1" }.should route_to(:controller => "aircraft_types", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/aircraft_types/1/edit" }.should route_to(:controller => "aircraft_types", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/aircraft_types" }.should route_to(:controller => "aircraft_types", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/aircraft_types/1" }.should route_to(:controller => "aircraft_types", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/aircraft_types/1" }.should route_to(:controller => "aircraft_types", :action => "destroy", :id => "1") 
    end
  end
end
