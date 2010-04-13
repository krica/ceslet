require 'spec_helper'

describe AircraftModelsController do

  def mock_aircraft_model(stubs={})
    @mock_aircraft_model ||= mock_model(AircraftModel, stubs)
  end

  describe "GET index" do
    it "assigns all aircraft_models as @aircraft_models" do
      AircraftModel.stub(:find).with(:all).and_return([mock_aircraft_model])
      get :index
      assigns[:aircraft_models].should == [mock_aircraft_model]
    end
  end

  describe "GET show" do
    it "assigns the requested aircraft_model as @aircraft_model" do
      AircraftModel.stub(:find).with("37").and_return(mock_aircraft_model)
      get :show, :id => "37"
      assigns[:aircraft_model].should equal(mock_aircraft_model)
    end
  end

  describe "GET new" do
    it "assigns a new aircraft_model as @aircraft_model" do
      AircraftModel.stub(:new).and_return(mock_aircraft_model)
      get :new
      assigns[:aircraft_model].should equal(mock_aircraft_model)
    end
  end

  describe "GET edit" do
    it "assigns the requested aircraft_model as @aircraft_model" do
      AircraftModel.stub(:find).with("37").and_return(mock_aircraft_model)
      get :edit, :id => "37"
      assigns[:aircraft_model].should equal(mock_aircraft_model)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created aircraft_model as @aircraft_model" do
        AircraftModel.stub(:new).with({'these' => 'params'}).and_return(mock_aircraft_model(:save => true))
        post :create, :aircraft_model => {:these => 'params'}
        assigns[:aircraft_model].should equal(mock_aircraft_model)
      end

      it "redirects to the created aircraft_model" do
        AircraftModel.stub(:new).and_return(mock_aircraft_model(:save => true))
        post :create, :aircraft_model => {}
        response.should redirect_to(aircraft_model_url(mock_aircraft_model))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved aircraft_model as @aircraft_model" do
        AircraftModel.stub(:new).with({'these' => 'params'}).and_return(mock_aircraft_model(:save => false))
        post :create, :aircraft_model => {:these => 'params'}
        assigns[:aircraft_model].should equal(mock_aircraft_model)
      end

      it "re-renders the 'new' template" do
        AircraftModel.stub(:new).and_return(mock_aircraft_model(:save => false))
        post :create, :aircraft_model => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested aircraft_model" do
        AircraftModel.should_receive(:find).with("37").and_return(mock_aircraft_model)
        mock_aircraft_model.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :aircraft_model => {:these => 'params'}
      end

      it "assigns the requested aircraft_model as @aircraft_model" do
        AircraftModel.stub(:find).and_return(mock_aircraft_model(:update_attributes => true))
        put :update, :id => "1"
        assigns[:aircraft_model].should equal(mock_aircraft_model)
      end

      it "redirects to the aircraft_model" do
        AircraftModel.stub(:find).and_return(mock_aircraft_model(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(aircraft_model_url(mock_aircraft_model))
      end
    end

    describe "with invalid params" do
      it "updates the requested aircraft_model" do
        AircraftModel.should_receive(:find).with("37").and_return(mock_aircraft_model)
        mock_aircraft_model.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :aircraft_model => {:these => 'params'}
      end

      it "assigns the aircraft_model as @aircraft_model" do
        AircraftModel.stub(:find).and_return(mock_aircraft_model(:update_attributes => false))
        put :update, :id => "1"
        assigns[:aircraft_model].should equal(mock_aircraft_model)
      end

      it "re-renders the 'edit' template" do
        AircraftModel.stub(:find).and_return(mock_aircraft_model(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested aircraft_model" do
      AircraftModel.should_receive(:find).with("37").and_return(mock_aircraft_model)
      mock_aircraft_model.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the aircraft_models list" do
      AircraftModel.stub(:find).and_return(mock_aircraft_model(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(aircraft_models_url)
    end
  end

end
