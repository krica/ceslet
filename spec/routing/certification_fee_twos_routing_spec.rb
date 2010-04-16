require 'spec_helper'

describe CertificationFeeTwosController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/certification_fee_twos" }.should route_to(:controller => "certification_fee_twos", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/certification_fee_twos/new" }.should route_to(:controller => "certification_fee_twos", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/certification_fee_twos/1" }.should route_to(:controller => "certification_fee_twos", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/certification_fee_twos/1/edit" }.should route_to(:controller => "certification_fee_twos", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/certification_fee_twos" }.should route_to(:controller => "certification_fee_twos", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/certification_fee_twos/1" }.should route_to(:controller => "certification_fee_twos", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/certification_fee_twos/1" }.should route_to(:controller => "certification_fee_twos", :action => "destroy", :id => "1") 
    end
  end
end
