class CertificationFeeTwosController < ApplicationController
  
  include AuthenticatedSystem
  layout 'ceslet', :except => :remote_create 

  before_filter :login_required
  before_filter :restrict_observer, :only => [:update, :edit, :new, :create]
  before_filter :only_admin, :only => [:destroy]
  
  # GET /certification_fee_twos
  # GET /certification_fee_twos.xml
  def index
    @certification_fee_twos = CertificationFeeTwo.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @certification_fee_twos }
    end
  end

  # GET /certification_fee_twos/1
  # GET /certification_fee_twos/1.xml
  def show
    @certification_fee_two = CertificationFeeTwo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @certification_fee_two }
    end
  end

  # GET /certification_fee_twos/new
  # GET /certification_fee_twos/new.xml
  def new
    @certification_fee_two = CertificationFeeTwo.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @certification_fee_two }
    end
  end

  # GET /certification_fee_twos/1/edit
  def edit
    @certification_fee_two = CertificationFeeTwo.find(params[:id])
  end

  # POST /certification_fee_twos
  # POST /certification_fee_twos.xml
    def create
    @certification_fee_two = CertificationFeeTwo.new(params[:certification_fee_two])

    respond_to do |format|
      if @certification_fee_two.save
        add_to_log(t('Cetrtification fee two created log') + @certification_fee_two.kind,"certification_fee_twos","create")
        flash[:notice] = t('Certification fee two created')
        if params[:submit_continue] == I18n.t('Create and continue')
          format.html { redirect_to(:action => :new) }
        else
          format.html { redirect_to(@certification_fee_two) }
          format.xml  { render :xml => @certification_fee_two, :status => :created, :location => @certification_fee_two }
        end
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @certification_fee_two.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /certification_fee_twos/1
  # PUT /certification_fee_twos/1.xml
  def update
    @certification_fee_two = CertificationFeeTwo.find(params[:id])

    respond_to do |format|
      if @certification_fee_two.update_attributes(params[:certification_fee_two])
        add_to_log(t('Cetrtification fee two updated log') + @certification_fee_two.kind,"certification_fee_twos","update")
        flash[:notice] = t('Certification fee two updated')
        format.html { redirect_to(@certification_fee_two) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @certification_fee_two.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /certification_fee_twos/1
  # DELETE /certification_fee_twos/1.xml
  def destroy
    @certification_fee_two = CertificationFeeTwo.find(params[:id])
    @certification_fee_two.destroy
    add_to_log(t('Cetrtification fee two destroy log') + @certification_fee_two.kind,"certification_fee_twos","update")

    respond_to do |format|
      format.html { redirect_to(certification_fee_twos_url) }
      format.xml  { head :ok }
    end
  end
end
