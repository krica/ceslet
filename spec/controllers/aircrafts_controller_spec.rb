require 'spec_helper'

describe AircraftsController do

  def mock_aircraft(stubs={})
    @mock_aircraft ||= mock_model(Aircraft, stubs)
  end

  describe "GET index" do
    it "assigns all aircrafts as @aircrafts" do
      Aircraft.stub(:find).with(:all).and_return([mock_aircraft])
      get :index
      assigns[:aircrafts].should == [mock_aircraft]
    end
  end

  describe "GET show" do
    it "assigns the requested aircraft as @aircraft" do
      Aircraft.stub(:find).with("37").and_return(mock_aircraft)
      get :show, :id => "37"
      assigns[:aircraft].should equal(mock_aircraft)
    end
  end

  describe "GET new" do
    it "assigns a new aircraft as @aircraft" do
      Aircraft.stub(:new).and_return(mock_aircraft)
      get :new
      assigns[:aircraft].should equal(mock_aircraft)
    end
  end

  describe "GET edit" do
    it "assigns the requested aircraft as @aircraft" do
      Aircraft.stub(:find).with("37").and_return(mock_aircraft)
      get :edit, :id => "37"
      assigns[:aircraft].should equal(mock_aircraft)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created aircraft as @aircraft" do
        Aircraft.stub(:new).with({'these' => 'params'}).and_return(mock_aircraft(:save => true))
        post :create, :aircraft => {:these => 'params'}
        assigns[:aircraft].should equal(mock_aircraft)
      end

      it "redirects to the created aircraft" do
        Aircraft.stub(:new).and_return(mock_aircraft(:save => true))
        post :create, :aircraft => {}
        response.should redirect_to(aircraft_url(mock_aircraft))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved aircraft as @aircraft" do
        Aircraft.stub(:new).with({'these' => 'params'}).and_return(mock_aircraft(:save => false))
        post :create, :aircraft => {:these => 'params'}
        assigns[:aircraft].should equal(mock_aircraft)
      end

      it "re-renders the 'new' template" do
        Aircraft.stub(:new).and_return(mock_aircraft(:save => false))
        post :create, :aircraft => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested aircraft" do
        Aircraft.should_receive(:find).with("37").and_return(mock_aircraft)
        mock_aircraft.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :aircraft => {:these => 'params'}
      end

      it "assigns the requested aircraft as @aircraft" do
        Aircraft.stub(:find).and_return(mock_aircraft(:update_attributes => true))
        put :update, :id => "1"
        assigns[:aircraft].should equal(mock_aircraft)
      end

      it "redirects to the aircraft" do
        Aircraft.stub(:find).and_return(mock_aircraft(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(aircraft_url(mock_aircraft))
      end
    end

    describe "with invalid params" do
      it "updates the requested aircraft" do
        Aircraft.should_receive(:find).with("37").and_return(mock_aircraft)
        mock_aircraft.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :aircraft => {:these => 'params'}
      end

      it "assigns the aircraft as @aircraft" do
        Aircraft.stub(:find).and_return(mock_aircraft(:update_attributes => false))
        put :update, :id => "1"
        assigns[:aircraft].should equal(mock_aircraft)
      end

      it "re-renders the 'edit' template" do
        Aircraft.stub(:find).and_return(mock_aircraft(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested aircraft" do
      Aircraft.should_receive(:find).with("37").and_return(mock_aircraft)
      mock_aircraft.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the aircrafts list" do
      Aircraft.stub(:find).and_return(mock_aircraft(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(aircrafts_url)
    end
  end

end
