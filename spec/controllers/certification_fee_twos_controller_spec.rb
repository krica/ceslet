require 'spec_helper'

describe CertificationFeeTwosController do

  def mock_certification_fee_two(stubs={})
    @mock_certification_fee_two ||= mock_model(CertificationFeeTwo, stubs)
  end

  describe "GET index" do
    it "assigns all certification_fee_twos as @certification_fee_twos" do
      CertificationFeeTwo.stub(:find).with(:all).and_return([mock_certification_fee_two])
      get :index
      assigns[:certification_fee_twos].should == [mock_certification_fee_two]
    end
  end

  describe "GET show" do
    it "assigns the requested certification_fee_two as @certification_fee_two" do
      CertificationFeeTwo.stub(:find).with("37").and_return(mock_certification_fee_two)
      get :show, :id => "37"
      assigns[:certification_fee_two].should equal(mock_certification_fee_two)
    end
  end

  describe "GET new" do
    it "assigns a new certification_fee_two as @certification_fee_two" do
      CertificationFeeTwo.stub(:new).and_return(mock_certification_fee_two)
      get :new
      assigns[:certification_fee_two].should equal(mock_certification_fee_two)
    end
  end

  describe "GET edit" do
    it "assigns the requested certification_fee_two as @certification_fee_two" do
      CertificationFeeTwo.stub(:find).with("37").and_return(mock_certification_fee_two)
      get :edit, :id => "37"
      assigns[:certification_fee_two].should equal(mock_certification_fee_two)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created certification_fee_two as @certification_fee_two" do
        CertificationFeeTwo.stub(:new).with({'these' => 'params'}).and_return(mock_certification_fee_two(:save => true))
        post :create, :certification_fee_two => {:these => 'params'}
        assigns[:certification_fee_two].should equal(mock_certification_fee_two)
      end

      it "redirects to the created certification_fee_two" do
        CertificationFeeTwo.stub(:new).and_return(mock_certification_fee_two(:save => true))
        post :create, :certification_fee_two => {}
        response.should redirect_to(certification_fee_two_url(mock_certification_fee_two))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved certification_fee_two as @certification_fee_two" do
        CertificationFeeTwo.stub(:new).with({'these' => 'params'}).and_return(mock_certification_fee_two(:save => false))
        post :create, :certification_fee_two => {:these => 'params'}
        assigns[:certification_fee_two].should equal(mock_certification_fee_two)
      end

      it "re-renders the 'new' template" do
        CertificationFeeTwo.stub(:new).and_return(mock_certification_fee_two(:save => false))
        post :create, :certification_fee_two => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested certification_fee_two" do
        CertificationFeeTwo.should_receive(:find).with("37").and_return(mock_certification_fee_two)
        mock_certification_fee_two.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :certification_fee_two => {:these => 'params'}
      end

      it "assigns the requested certification_fee_two as @certification_fee_two" do
        CertificationFeeTwo.stub(:find).and_return(mock_certification_fee_two(:update_attributes => true))
        put :update, :id => "1"
        assigns[:certification_fee_two].should equal(mock_certification_fee_two)
      end

      it "redirects to the certification_fee_two" do
        CertificationFeeTwo.stub(:find).and_return(mock_certification_fee_two(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(certification_fee_two_url(mock_certification_fee_two))
      end
    end

    describe "with invalid params" do
      it "updates the requested certification_fee_two" do
        CertificationFeeTwo.should_receive(:find).with("37").and_return(mock_certification_fee_two)
        mock_certification_fee_two.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :certification_fee_two => {:these => 'params'}
      end

      it "assigns the certification_fee_two as @certification_fee_two" do
        CertificationFeeTwo.stub(:find).and_return(mock_certification_fee_two(:update_attributes => false))
        put :update, :id => "1"
        assigns[:certification_fee_two].should equal(mock_certification_fee_two)
      end

      it "re-renders the 'edit' template" do
        CertificationFeeTwo.stub(:find).and_return(mock_certification_fee_two(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested certification_fee_two" do
      CertificationFeeTwo.should_receive(:find).with("37").and_return(mock_certification_fee_two)
      mock_certification_fee_two.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the certification_fee_twos list" do
      CertificationFeeTwo.stub(:find).and_return(mock_certification_fee_two(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(certification_fee_twos_url)
    end
  end

end
