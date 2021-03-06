class AircraftsController < ApplicationController
  include AuthenticatedSystem
  layout 'ceslet', :except => [:update_model, :remote_create_type]
  
  before_filter :login_required
  before_filter :restrict_observer, :only => [:update, :edit, :new, :create, :remote_create_type, :update_model]
  before_filter :only_admin, :only => [:destroy]

  def remote_create_type
    @aircraft_type = AircraftType.new
    @aircraft_type.name = params[:name]
    @aircraft_type.save
    @aircraft_types = AircraftType.find(:all)
  end

  def update_model
    @models = AircraftModel.find(:all, :conditions => {:aircraft_type_id => params[:type_id]})
  end
  
  # GET /aircrafts
  # GET /aircrafts.xml
  def index
    @aircrafts = Aircraft.paginate(:page => params[:page], :per_page => 12, :order => :matriculation)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @aircrafts }
    end
  end

  # GET /aircrafts/1
  # GET /aircrafts/1.xml
  def show
    @aircraft = Aircraft.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @aircraft }
    end
  end

  # GET /aircrafts/new
  # GET /aircrafts/new.xml
  def new
    @aircraft = Aircraft.new
    @aircraft_types = AircraftType.find(:all)

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @aircraft }
    end
  end

  # GET /aircrafts/1/edit
  def edit
    @aircraft = Aircraft.find(params[:id])
  end

  # POST /aircrafts
  # POST /aircrafts.xml
  def create
    @aircraft = Aircraft.new(params[:aircraft])

    respond_to do |format|
      if @aircraft.save
        add_to_log(t('Aircraft created log') + @aircraft.name,"aircrafts","create")
        flash[:notice] = t('Aircraft created')
        if params[:submit_continue] == I18n.t('Create and continue')
          format.html { redirect_to(:action => :new) }
        else
          format.html { redirect_to(@aircraft) }
          format.xml  { render :xml => @aircraft, :status => :created, :location => @aircraft }
        end
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @aircraft.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /aircrafts/1
  # PUT /aircrafts/1.xml
  def update
    @aircraft = Aircraft.find(params[:id])

    respond_to do |format|
      if @aircraft.update_attributes(params[:aircraft])
        add_to_log(t('Aircraft updated log') + @aircraft.name,"aircrafts","update")
        flash[:notice] = t('Aircraft updated')
        format.html { redirect_to(@aircraft) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @aircraft.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /aircrafts/1
  # DELETE /aircrafts/1.xml
  def destroy
    @aircraft = Aircraft.find(params[:id])
    @aircraft.destroy
    add_to_log(t('Aircraft destroy log') + @aircraft.name,"aircrafts","destroy")

    respond_to do |format|
      format.html { redirect_to(aircrafts_url) }
      format.xml  { head :ok }
    end
  end
end
