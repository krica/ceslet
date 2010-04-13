require 'spec_helper'

describe AircraftTypesController do

  def mock_aircraft_type(stubs={})
    @mock_aircraft_type ||= mock_model(AircraftType, stubs)
  end

  describe "GET index" do
    it "assigns all aircraft_types as @aircraft_types" do
      AircraftType.stub(:find).with(:all).and_return([mock_aircraft_type])
      get :index
      assigns[:aircraft_types].should == [mock_aircraft_type]
    end
  end

  describe "GET show" do
    it "assigns the requested aircraft_type as @aircraft_type" do
      AircraftType.stub(:find).with("37").and_return(mock_aircraft_type)
      get :show, :id => "37"
      assigns[:aircraft_type].should equal(mock_aircraft_type)
    end
  end

  describe "GET new" do
    it "assigns a new aircraft_type as @aircraft_type" do
      AircraftType.stub(:new).and_return(mock_aircraft_type)
      get :new
      assigns[:aircraft_type].should equal(mock_aircraft_type)
    end
  end

  describe "GET edit" do
    it "assigns the requested aircraft_type as @aircraft_type" do
      AircraftType.stub(:find).with("37").and_return(mock_aircraft_type)
      get :edit, :id => "37"
      assigns[:aircraft_type].should equal(mock_aircraft_type)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created aircraft_type as @aircraft_type" do
        AircraftType.stub(:new).with({'these' => 'params'}).and_return(mock_aircraft_type(:save => true))
        post :create, :aircraft_type => {:these => 'params'}
        assigns[:aircraft_type].should equal(mock_aircraft_type)
      end

      it "redirects to the created aircraft_type" do
        AircraftType.stub(:new).and_return(mock_aircraft_type(:save => true))
        post :create, :aircraft_type => {}
        response.should redirect_to(aircraft_type_url(mock_aircraft_type))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved aircraft_type as @aircraft_type" do
        AircraftType.stub(:new).with({'these' => 'params'}).and_return(mock_aircraft_type(:save => false))
        post :create, :aircraft_type => {:these => 'params'}
        assigns[:aircraft_type].should equal(mock_aircraft_type)
      end

      it "re-renders the 'new' template" do
        AircraftType.stub(:new).and_return(mock_aircraft_type(:save => false))
        post :create, :aircraft_type => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested aircraft_type" do
        AircraftType.should_receive(:find).with("37").and_return(mock_aircraft_type)
        mock_aircraft_type.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :aircraft_type => {:these => 'params'}
      end

      it "assigns the requested aircraft_type as @aircraft_type" do
        AircraftType.stub(:find).and_return(mock_aircraft_type(:update_attributes => true))
        put :update, :id => "1"
        assigns[:aircraft_type].should equal(mock_aircraft_type)
      end

      it "redirects to the aircraft_type" do
        AircraftType.stub(:find).and_return(mock_aircraft_type(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(aircraft_type_url(mock_aircraft_type))
      end
    end

    describe "with invalid params" do
      it "updates the requested aircraft_type" do
        AircraftType.should_receive(:find).with("37").and_return(mock_aircraft_type)
        mock_aircraft_type.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :aircraft_type => {:these => 'params'}
      end

      it "assigns the aircraft_type as @aircraft_type" do
        AircraftType.stub(:find).and_return(mock_aircraft_type(:update_attributes => false))
        put :update, :id => "1"
        assigns[:aircraft_type].should equal(mock_aircraft_type)
      end

      it "re-renders the 'edit' template" do
        AircraftType.stub(:find).and_return(mock_aircraft_type(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested aircraft_type" do
      AircraftType.should_receive(:find).with("37").and_return(mock_aircraft_type)
      mock_aircraft_type.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the aircraft_types list" do
      AircraftType.stub(:find).and_return(mock_aircraft_type(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(aircraft_types_url)
    end
  end

end
