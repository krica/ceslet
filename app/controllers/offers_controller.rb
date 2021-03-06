class OffersController < ApplicationController
  
  include AuthenticatedSystem
  layout 'ceslet', :except => [:update_aircraft_model, :update_aircraft] 

  before_filter :login_required 
  before_filter :restrict_observer, :only => [:update, :edit, :new, :create]
  before_filter :only_admin, :only => [:destroy]
  
  #
  def update_aircraft_model
    @models = AircraftModel.find(:all, :conditions => {:aircraft_type_id => params[:type_id]})
    if @models.first != nil
      @aircrafts = Aircraft.find(:all, :conditions => {:active => true, :aircraft_model_id => @models.first.id})
    else 
      @aircrafts = []
    end
  end
  #d
  def update_aircraft
     @aircrafts = Aircraft.find(:all, :conditions => {:active => true, :aircraft_model_id => params[:model_id]})
  end

  def find_order_number
    if params[:order_number]
      begin
        @offer = Offer.find_by_order_number(params[:order_number])
        render :template => "offers/show"
      rescue
      redirect_to "/offers"
      flash[:notice] = t('Offer not found order number')
      end
    else
      redirect_to "/offers"
      flash[:notice] = t('Offer not found order number')
    end
  end
  
  
  # GET /offers
  # GET /offers.xml
  def index
    @offers = Offer.paginate(:all, :page => params[:page], :per_page => 12, :order => 'created_at desc')
    sort_offer
    

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @offers }
    end
  end

  # GET /offers/1
  # GET /offers/1.xml
  def show
    @offer = Offer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @offer }
    end
  end

  # GET /offers/new
  # GET /offers/new.xml
  def new
    @offer = Offer.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @offer }
    end
  end

  # GET /offers/1/edit
  def edit  
    @offer = Offer.find(params[:id])
  end

  # POST /offers
  # POST /offers.xml
  def create
    @offer = Offer.new(params[:offer])
    if params[:certification_fee_twos] != nil
      params[:certification_fee_twos].each do |id|
        @offer.certification_fee_twos << CertificationFeeTwo.find(id)
      end
    end
    respond_to do |format|
      if @offer.save
      if params[:offer][:current_visibility_type] == "visibility 3"
        @offer.current_visibility_type = params[:current_visibility_type_other]
      @offer.save
      end
      if params[:offer][:planned_visibility_type] == "visibility 3"
        @offer.planned_visibility_type = params[:planned_visibility_type_other]
      @offer.save
      end
        add_to_log(t('Created new offer no') + @offer.order_number,"offers","create")
        flash[:notice] = t('Offer created')
        if params[:submit_continue] == I18n.t('Create and continue')
          format.html { redirect_to(:action => :new) }
        else
          format.html { redirect_to(@offer) }
          format.xml  { render :xml => @offer, :status => :created, :location => @offer }
        end
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @offer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /offers/1
  # PUT /offers/1.xml
  def update
    @offer = Offer.find(params[:id])
    @offer.certification_fee_twos.delete_all
    if params[:certification_fee_twos] != nil
      params[:certification_fee_twos].each do |id|
        @offer.certification_fee_twos << CertificationFeeTwo.find(id)
      end
    end

    respond_to do |format|
      if @offer.update_attributes(params[:offer])
      if params[:offer][:current_visibility_type] == "visibility 3"
        @offer.current_visibility_type = params[:current_visibility_type_other]
      @offer.save
      end
      if params[:offer][:planned_visibility_type] == "visibility 3"
        @offer.planned_visibility_type = params[:planned_visibility_type_other]
      @offer.save
      end
        flash[:notice] = t('Offer updated')
        add_to_log(t('Updated offer no') + @offer.order_number, "offers","update")
        format.html { redirect_to(@offer) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @offer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /offers/1
  # DELETE /offers/1.xml
  def destroy
    @offer = Offer.find(params[:id])
    @offer.destroy
    add_to_log(t('Destroyed offer no') + @offer.order_number,"offers","destroy")
    respond_to do |format|
      format.html { redirect_to(offers_url) }
      format.xml  { head :ok }
    end
  end

  private

  def sort_offer
    if params[:sort_by]
      if params[:sort_by] == "aircrafts"
    @offers = Offer.paginate(:all, :page => params[:page], :per_page => 12, :order => 'aircraft_id desc')
        @offers.sort! { |a,b| a.aircraft.name.downcase <=> b.aircraft.name.downcase }
      elsif params[:sort_by] == "created_at"
    @offers = Offer.paginate(:all, :page => params[:page], :per_page => 12, :order => 'created_at desc')
        return
     elsif params[:sort_by] == "order_number"
    @offers = Offer.paginate(:all, :page => params[:page], :per_page => 12, :order => 'order_number')
      @offers.sort! { |a,b| a.order_number.downcase <=> b.order_number.downcase }
      end
    end
  end
end
