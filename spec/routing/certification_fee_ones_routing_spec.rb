require 'spec_helper'

describe CertificationFeeOnesController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/certification_fee_ones" }.should route_to(:controller => "certification_fee_ones", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/certification_fee_ones/new" }.should route_to(:controller => "certification_fee_ones", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/certification_fee_ones/1" }.should route_to(:controller => "certification_fee_ones", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/certification_fee_ones/1/edit" }.should route_to(:controller => "certification_fee_ones", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/certification_fee_ones" }.should route_to(:controller => "certification_fee_ones", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/certification_fee_ones/1" }.should route_to(:controller => "certification_fee_ones", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/certification_fee_ones/1" }.should route_to(:controller => "certification_fee_ones", :action => "destroy", :id => "1") 
    end
  end
end
