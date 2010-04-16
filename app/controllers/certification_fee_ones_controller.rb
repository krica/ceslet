class CertificationFeeOnesController < ApplicationController
  include AuthenticatedSystem
  layout 'ceslet' 
  before_filter :login_required, :only => [:new, :edit, :show, :index, :destroy, :update] 
  # GET /certification_fee_ones
  # GET /certification_fee_ones.xml
  def index
    @certification_fee_ones = CertificationFeeOne.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @certification_fee_ones }
    end
  end

  # GET /certification_fee_ones/1
  # GET /certification_fee_ones/1.xml
  def show
    @certification_fee_one = CertificationFeeOne.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @certification_fee_one }
    end
  end

  # GET /certification_fee_ones/new
  # GET /certification_fee_ones/new.xml
  def new
    @certification_fee_one = CertificationFeeOne.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @certification_fee_one }
    end
  end

  # GET /certification_fee_ones/1/edit
  def edit
    @certification_fee_one = CertificationFeeOne.find(params[:id])
  end

  # POST /certification_fee_ones
  # POST /certification_fee_ones.xml
  def create
    @certification_fee_one = CertificationFeeOne.new(params[:certification_fee_one])

    respond_to do |format|
      if @certification_fee_one.save
        flash[:notice] = t('Certification fee one created')
        format.html { redirect_to(@certification_fee_one) }
        format.xml  { render :xml => @certification_fee_one, :status => :created, :location => @certification_fee_one }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @certification_fee_one.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /certification_fee_ones/1
  # PUT /certification_fee_ones/1.xml
  def update
    @certification_fee_one = CertificationFeeOne.find(params[:id])
    respond_to do |format|
      if @certification_fee_one.update_attributes(params[:certification_fee_one])
        flash[:notice] = t('Certification fee one updated')
        format.html { redirect_to(@certification_fee_one) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @certification_fee_one.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /certification_fee_ones/1
  # DELETE /certification_fee_ones/1.xml
  def destroy
    @certification_fee_one = CertificationFeeOne.find(params[:id])
    @certification_fee_one.destroy

    respond_to do |format|
      format.html { redirect_to(certification_fee_ones_url) }
      format.xml  { head :ok }
    end
  end
end
