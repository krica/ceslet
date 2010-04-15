require 'spec_helper'

describe RegulationBasesController do

  def mock_regulation_basis(stubs={})
    @mock_regulation_basis ||= mock_model(RegulationBasis, stubs)
  end

  describe "GET index" do
    it "assigns all regulation_bases as @regulation_bases" do
      RegulationBasis.stub(:find).with(:all).and_return([mock_regulation_basis])
      get :index
      assigns[:regulation_bases].should == [mock_regulation_basis]
    end
  end

  describe "GET show" do
    it "assigns the requested regulation_basis as @regulation_basis" do
      RegulationBasis.stub(:find).with("37").and_return(mock_regulation_basis)
      get :show, :id => "37"
      assigns[:regulation_basis].should equal(mock_regulation_basis)
    end
  end

  describe "GET new" do
    it "assigns a new regulation_basis as @regulation_basis" do
      RegulationBasis.stub(:new).and_return(mock_regulation_basis)
      get :new
      assigns[:regulation_basis].should equal(mock_regulation_basis)
    end
  end

  describe "GET edit" do
    it "assigns the requested regulation_basis as @regulation_basis" do
      RegulationBasis.stub(:find).with("37").and_return(mock_regulation_basis)
      get :edit, :id => "37"
      assigns[:regulation_basis].should equal(mock_regulation_basis)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created regulation_basis as @regulation_basis" do
        RegulationBasis.stub(:new).with({'these' => 'params'}).and_return(mock_regulation_basis(:save => true))
        post :create, :regulation_basis => {:these => 'params'}
        assigns[:regulation_basis].should equal(mock_regulation_basis)
      end

      it "redirects to the created regulation_basis" do
        RegulationBasis.stub(:new).and_return(mock_regulation_basis(:save => true))
        post :create, :regulation_basis => {}
        response.should redirect_to(regulation_basis_url(mock_regulation_basis))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved regulation_basis as @regulation_basis" do
        RegulationBasis.stub(:new).with({'these' => 'params'}).and_return(mock_regulation_basis(:save => false))
        post :create, :regulation_basis => {:these => 'params'}
        assigns[:regulation_basis].should equal(mock_regulation_basis)
      end

      it "re-renders the 'new' template" do
        RegulationBasis.stub(:new).and_return(mock_regulation_basis(:save => false))
        post :create, :regulation_basis => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested regulation_basis" do
        RegulationBasis.should_receive(:find).with("37").and_return(mock_regulation_basis)
        mock_regulation_basis.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :regulation_basis => {:these => 'params'}
      end

      it "assigns the requested regulation_basis as @regulation_basis" do
        RegulationBasis.stub(:find).and_return(mock_regulation_basis(:update_attributes => true))
        put :update, :id => "1"
        assigns[:regulation_basis].should equal(mock_regulation_basis)
      end

      it "redirects to the regulation_basis" do
        RegulationBasis.stub(:find).and_return(mock_regulation_basis(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(regulation_basis_url(mock_regulation_basis))
      end
    end

    describe "with invalid params" do
      it "updates the requested regulation_basis" do
        RegulationBasis.should_receive(:find).with("37").and_return(mock_regulation_basis)
        mock_regulation_basis.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :regulation_basis => {:these => 'params'}
      end

      it "assigns the regulation_basis as @regulation_basis" do
        RegulationBasis.stub(:find).and_return(mock_regulation_basis(:update_attributes => false))
        put :update, :id => "1"
        assigns[:regulation_basis].should equal(mock_regulation_basis)
      end

      it "re-renders the 'edit' template" do
        RegulationBasis.stub(:find).and_return(mock_regulation_basis(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested regulation_basis" do
      RegulationBasis.should_receive(:find).with("37").and_return(mock_regulation_basis)
      mock_regulation_basis.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the regulation_bases list" do
      RegulationBasis.stub(:find).and_return(mock_regulation_basis(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(regulation_bases_url)
    end
  end

end
