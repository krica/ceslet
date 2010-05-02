class AircraftModelsController < ApplicationController
  include AuthenticatedSystem
  layout 'ceslet', :except => :remote_create 

  before_filter :login_required 
  before_filter :restrict_observer, :only => [:update, :edit, :new, :create]
  before_filter :only_admin, :only => [:destroy]

  def remote_create
    @aircraft_model = AircraftModel.new()
    @aircraft_model.name = params[:name]
    @aircraft_model.aircraft_type_id = params[:partial][:aircraft_type_id]
    @aircraft_model.tcds = params[:tcds]
    @aircraft_model.supplementary_indications = params[:supplementary_indications]
    @aircraft_model.mtow_kg = params[:mtow_kg]
    @aircraft_model.speed_vno = params[:speed_vno]
    @aircraft_model.speed_vne = params[:speed_vne]
    @aircraft_model.speed_vmin = params[:speed_vmin]
    @aircraft_model.original_regulation_basis = params[:original_regulation_basis]
    @aircraft_model.number_of_passengers = params[:number_of_passengers]
    @aircraft_model.number_of_engines = params[:number_of_engines]
    @aircraft_model.engine_type = params[:engine_type]

    @aircraft_model.save
    add_to_log(t('Aircraft model created log') + @aircraft_model.name,"aircraft_models","create")
    @aircraft_models = AircraftModel.find(:all)
  end

  # GET /aircraft_models
  # GET /aircraft_models.xml
  def index
    @aircraft_models = AircraftModel.all(:order => :name)

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
        add_to_log(t('Aircraft model created log') + @aircraft_model.name,"aircraft_models","create")
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
        add_to_log(t('Aircraft model updated log') + @aircraft_model.name,"aircraft_models","update")
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
    add_to_log(t('Aircraft model destroy log') + @aircraft_model.name,"aircraft_models","destroy")

    respond_to do |format|
      format.html { redirect_to(aircraft_models_url) }
      format.xml  { head :ok }
    end
  end
end
