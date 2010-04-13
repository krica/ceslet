class AircraftModelsController < ApplicationController
  include AuthenticatedSystem
  layout 'ceslet' 

  before_filter :login_required, :only => [:new, :edit, :show, :index, :destroy, :update] 
  # GET /aircraft_models
  # GET /aircraft_models.xml
  def index
    @aircraft_models = AircraftModel.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @aircraft_models }
    end
  end

  # GET /aircraft_models/1
  # GET /aircraft_models/1.xml
  def show
    @aircraft_model = AircraftModel.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @aircraft_model }
    end
  end

  # GET /aircraft_models/new
  # GET /aircraft_models/new.xml
  def new
    @aircraft_model = AircraftModel.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @aircraft_model }
    end
  end

  # GET /aircraft_models/1/edit
  def edit
    @aircraft_model = AircraftModel.find(params[:id])
  end

  # POST /aircraft_models
  # POST /aircraft_models.xml
  def create
    @aircraft_model = AircraftModel.new(params[:aircraft_model])

    respond_to do |format|
      if @aircraft_model.save
        flash[:notice] = t('Aircaft model created')
        format.html { redirect_to(@aircraft_model) }
        format.xml  { render :xml => @aircraft_model, :status => :created, :location => @aircraft_model }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @aircraft_model.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /aircraft_models/1
  # PUT /aircraft_models/1.xml
  def update
    @aircraft_model = AircraftModel.find(params[:id])

    respond_to do |format|
      if @aircraft_model.update_attributes(params[:aircraft_model])
        flash[:notice] = t('Aircaft model updated')
        format.html { redirect_to(@aircraft_model) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @aircraft_model.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /aircraft_models/1
  # DELETE /aircraft_models/1.xml
  def destroy
    @aircraft_model = AircraftModel.find(params[:id])
    @aircraft_model.destroy

    respond_to do |format|
      format.html { redirect_to(aircraft_models_url) }
      format.xml  { head :ok }
    end
  end
end
