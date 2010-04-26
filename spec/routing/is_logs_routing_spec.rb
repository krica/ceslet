require 'spec_helper'

describe IsLogsController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/is_logs" }.should route_to(:controller => "is_logs", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/is_logs/new" }.should route_to(:controller => "is_logs", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/is_logs/1" }.should route_to(:controller => "is_logs", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/is_logs/1/edit" }.should route_to(:controller => "is_logs", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/is_logs" }.should route_to(:controller => "is_logs", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/is_logs/1" }.should route_to(:controller => "is_logs", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/is_logs/1" }.should route_to(:controller => "is_logs", :action => "destroy", :id => "1") 
    end
  end
end
