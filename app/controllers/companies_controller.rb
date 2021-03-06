class CompaniesController < ApplicationController
  
  include AuthenticatedSystem
  layout 'ceslet' 
  
  before_filter :login_required
  before_filter :restrict_observer, :only => [:update, :edit, :new, :create]
  before_filter :only_admin, :only => [:destroy]
  # GET /companies
  # GET /companies.xml
  def index
    @companies = Company.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @companies }
    end
  end

  # GET /companies/1
  # GET /companies/1.xml
  def show
    @company = Company.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @company }
    end
  end

  # GET /companies/new
  # GET /companies/new.xml
  def new
    @company = Company.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @company }
    end
  end

  # GET /companies/1/edit
  def edit
    @company = Company.find(params[:id])
  end

  # POST /companies
  # POST /companies.xml
  def create
    @company = Company.new(params[:company])

    respond_to do |format|
      if @company.save
        add_to_log(t('Company created log') + @company.name,"companies","create")
        flash[:notice] = t('Company created')
        if params[:submit_continue] == I18n.t('Create and continue')
          format.html { redirect_to(:action => :new) }
        else
          format.html { redirect_to(@company) }
          format.xml  { render :xml => @company, :status => :created, :location => @company }
        end
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @company.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /companies/1
  # PUT /companies/1.xml
  def update
    @company = Company.find(params[:id])

    respond_to do |format|
      if @company.update_attributes(params[:company])
        add_to_log(t('Company updated log') + @company.name,"companies","update")
        flash[:notice] = t('Company updated')
        format.html { redirect_to(@company) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @company.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.xml
  def destroy
    @company = Company.find(params[:id])
    @company.destroy
    add_to_log(t('Company destroy log') + @company.name,"companies","destroy")

    respond_to do |format|
      format.html { redirect_to(companies_url) }
      format.xml  { head :ok }
    end
  end
end
