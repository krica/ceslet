class OffersController < ApplicationController
  
  include AuthenticatedSystem
  layout 'ceslet', :except => :remote_create 

  before_filter :login_required 
  # GET /offers
  # GET /offers.xml
  def index
    @offers = Offer.all

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
        add_to_log(t('Created new offer no') + @offer.order_number)
        flash[:notice] = t('Offer created')
        format.html { redirect_to(@offer) }
        format.xml  { render :xml => @offer, :status => :created, :location => @offer }
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

    respond_to do |format|
      format.html { redirect_to(offers_url) }
      format.xml  { head :ok }
    end
  end
end
