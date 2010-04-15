require 'spec_helper'

describe CertificationFeeOnesController do

  def mock_certification_fee_one(stubs={})
    @mock_certification_fee_one ||= mock_model(CertificationFeeOne, stubs)
  end

  describe "GET index" do
    it "assigns all certification_fee_ones as @certification_fee_ones" do
      CertificationFeeOne.stub(:find).with(:all).and_return([mock_certification_fee_one])
      get :index
      assigns[:certification_fee_ones].should == [mock_certification_fee_one]
    end
  end

  describe "GET show" do
    it "assigns the requested certification_fee_one as @certification_fee_one" do
      CertificationFeeOne.stub(:find).with("37").and_return(mock_certification_fee_one)
      get :show, :id => "37"
      assigns[:certification_fee_one].should equal(mock_certification_fee_one)
    end
  end

  describe "GET new" do
    it "assigns a new certification_fee_one as @certification_fee_one" do
      CertificationFeeOne.stub(:new).and_return(mock_certification_fee_one)
      get :new
      assigns[:certification_fee_one].should equal(mock_certification_fee_one)
    end
  end

  describe "GET edit" do
    it "assigns the requested certification_fee_one as @certification_fee_one" do
      CertificationFeeOne.stub(:find).with("37").and_return(mock_certification_fee_one)
      get :edit, :id => "37"
      assigns[:certification_fee_one].should equal(mock_certification_fee_one)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created certification_fee_one as @certification_fee_one" do
        CertificationFeeOne.stub(:new).with({'these' => 'params'}).and_return(mock_certification_fee_one(:save => true))
        post :create, :certification_fee_one => {:these => 'params'}
        assigns[:certification_fee_one].should equal(mock_certification_fee_one)
      end

      it "redirects to the created certification_fee_one" do
        CertificationFeeOne.stub(:new).and_return(mock_certification_fee_one(:save => true))
        post :create, :certification_fee_one => {}
        response.should redirect_to(certification_fee_one_url(mock_certification_fee_one))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved certification_fee_one as @certification_fee_one" do
        CertificationFeeOne.stub(:new).with({'these' => 'params'}).and_return(mock_certification_fee_one(:save => false))
        post :create, :certification_fee_one => {:these => 'params'}
        assigns[:certification_fee_one].should equal(mock_certification_fee_one)
      end

      it "re-renders the 'new' template" do
        CertificationFeeOne.stub(:new).and_return(mock_certification_fee_one(:save => false))
        post :create, :certification_fee_one => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested certification_fee_one" do
        CertificationFeeOne.should_receive(:find).with("37").and_return(mock_certification_fee_one)
        mock_certification_fee_one.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :certification_fee_one => {:these => 'params'}
      end

      it "assigns the requested certification_fee_one as @certification_fee_one" do
        CertificationFeeOne.stub(:find).and_return(mock_certification_fee_one(:update_attributes => true))
        put :update, :id => "1"
        assigns[:certification_fee_one].should equal(mock_certification_fee_one)
      end

      it "redirects to the certification_fee_one" do
        CertificationFeeOne.stub(:find).and_return(mock_certification_fee_one(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(certification_fee_one_url(mock_certification_fee_one))
      end
    end

    describe "with invalid params" do
      it "updates the requested certification_fee_one" do
        CertificationFeeOne.should_receive(:find).with("37").and_return(mock_certification_fee_one)
        mock_certification_fee_one.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :certification_fee_one => {:these => 'params'}
      end

      it "assigns the certification_fee_one as @certification_fee_one" do
        CertificationFeeOne.stub(:find).and_return(mock_certification_fee_one(:update_attributes => false))
        put :update, :id => "1"
        assigns[:certification_fee_one].should equal(mock_certification_fee_one)
      end

      it "re-renders the 'edit' template" do
        CertificationFeeOne.stub(:find).and_return(mock_certification_fee_one(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested certification_fee_one" do
      CertificationFeeOne.should_receive(:find).with("37").and_return(mock_certification_fee_one)
      mock_certification_fee_one.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the certification_fee_ones list" do
      CertificationFeeOne.stub(:find).and_return(mock_certification_fee_one(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(certification_fee_ones_url)
    end
  end

end
