class AircraftTypesController < ApplicationController
  
  include AuthenticatedSystem
  layout 'ceslet', :except => :remote_create 
  
  before_filter :login_required, :only => [:new, :edit, :show, :index, :destroy, :update] 
  # GET /aircraft_types
  # GET /aircraft_types.xml
  
  def remote_create
    @aircraft_type = AircraftType.new
    @aircraft_type.name = params[:name]
    @aircraft_type.save
    add_to_log(t('Aircraft type created log') + @aircraft_type.name,"aircraft_types","create")
    @aircraft_types = AircraftType.find(:all)
  end

  
  def index
    @aircraft_types = AircraftType.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @aircraft_types }
    end
  end

  # GET /aircraft_types/1
  # GET /aircraft_types/1.xml
  def show
    @aircraft_type = AircraftType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @aircraft_type }
    end
  end

  # GET /aircraft_types/new
  # GET /aircraft_types/new.xml
  def new
    @aircraft_type = AircraftType.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @aircraft_type }
    end
  end

  # GET /aircraft_types/1/edit
  def edit
    @aircraft_type = AircraftType.find(params[:id])
  end

  # POST /aircraft_types
  # POST /aircraft_types.xml
  def create
    @aircraft_type = AircraftType.new(params[:aircraft_type])

    respond_to do |format|
      if @aircraft_type.save
        add_to_log(t('Aircraft type created log') + @aircraft_type.name,"aircraft_types","create")
        flash[:notice] = t('Aircraft type created')
        format.html { redirect_to(@aircraft_type) }
        format.xml  { render :xml => @aircraft_type, :status => :created, :location => @aircraft_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @aircraft_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /aircraft_types/1
  # PUT /aircraft_types/1.xml
  def update
    @aircraft_type = AircraftType.find(params[:id])

    respond_to do |format|
      if @aircraft_type.update_attributes(params[:aircraft_type])
        add_to_log(t('Aircraft type updated log') + @aircraft_type.name,"aircraft_types","update")
        flash[:notice] = t('Aircraft type updated')
        format.html { redirect_to(@aircraft_type) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @aircraft_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /aircraft_types/1
  # DELETE /aircraft_types/1.xml
  def destroy
    only_admin
    @aircraft_type = AircraftType.find(params[:id])
    @aircraft_type.destroy
    add_to_log(t('Aircraft type destroy log') + @aircraft_type.name,"aircraft_types","destroy")

    respond_to do |format|
      format.html { redirect_to(aircraft_types_url) }
      format.xml  { head :ok }
    end
  end
end
