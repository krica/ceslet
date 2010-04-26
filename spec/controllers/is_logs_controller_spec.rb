require 'spec_helper'

describe IsLogsController do

  def mock_is_log(stubs={})
    @mock_is_log ||= mock_model(IsLog, stubs)
  end

  describe "GET index" do
    it "assigns all is_logs as @is_logs" do
      IsLog.stub(:find).with(:all).and_return([mock_is_log])
      get :index
      assigns[:is_logs].should == [mock_is_log]
    end
  end

  describe "GET show" do
    it "assigns the requested is_log as @is_log" do
      IsLog.stub(:find).with("37").and_return(mock_is_log)
      get :show, :id => "37"
      assigns[:is_log].should equal(mock_is_log)
    end
  end

  describe "GET new" do
    it "assigns a new is_log as @is_log" do
      IsLog.stub(:new).and_return(mock_is_log)
      get :new
      assigns[:is_log].should equal(mock_is_log)
    end
  end

  describe "GET edit" do
    it "assigns the requested is_log as @is_log" do
      IsLog.stub(:find).with("37").and_return(mock_is_log)
      get :edit, :id => "37"
      assigns[:is_log].should equal(mock_is_log)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created is_log as @is_log" do
        IsLog.stub(:new).with({'these' => 'params'}).and_return(mock_is_log(:save => true))
        post :create, :is_log => {:these => 'params'}
        assigns[:is_log].should equal(mock_is_log)
      end

      it "redirects to the created is_log" do
        IsLog.stub(:new).and_return(mock_is_log(:save => true))
        post :create, :is_log => {}
        response.should redirect_to(is_log_url(mock_is_log))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved is_log as @is_log" do
        IsLog.stub(:new).with({'these' => 'params'}).and_return(mock_is_log(:save => false))
        post :create, :is_log => {:these => 'params'}
        assigns[:is_log].should equal(mock_is_log)
      end

      it "re-renders the 'new' template" do
        IsLog.stub(:new).and_return(mock_is_log(:save => false))
        post :create, :is_log => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested is_log" do
        IsLog.should_receive(:find).with("37").and_return(mock_is_log)
        mock_is_log.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :is_log => {:these => 'params'}
      end

      it "assigns the requested is_log as @is_log" do
        IsLog.stub(:find).and_return(mock_is_log(:update_attributes => true))
        put :update, :id => "1"
        assigns[:is_log].should equal(mock_is_log)
      end

      it "redirects to the is_log" do
        IsLog.stub(:find).and_return(mock_is_log(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(is_log_url(mock_is_log))
      end
    end

    describe "with invalid params" do
      it "updates the requested is_log" do
        IsLog.should_receive(:find).with("37").and_return(mock_is_log)
        mock_is_log.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :is_log => {:these => 'params'}
      end

      it "assigns the is_log as @is_log" do
        IsLog.stub(:find).and_return(mock_is_log(:update_attributes => false))
        put :update, :id => "1"
        assigns[:is_log].should equal(mock_is_log)
      end

      it "re-renders the 'edit' template" do
        IsLog.stub(:find).and_return(mock_is_log(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested is_log" do
      IsLog.should_receive(:find).with("37").and_return(mock_is_log)
      mock_is_log.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the is_logs list" do
      IsLog.stub(:find).and_return(mock_is_log(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(is_logs_url)
    end
  end

end
