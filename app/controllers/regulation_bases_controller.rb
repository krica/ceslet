class RegulationBasesController < ApplicationController
  
  include AuthenticatedSystem
  layout 'ceslet' 

  before_filter :login_required, :only => [:new, :edit, :show, :index, :destroy, :update, :main] 
  # GET /regulation_bases
  # GET /regulation_bases.xml
  def index
    @regulation_bases = RegulationBasis.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @regulation_bases }
    end
  end

  # GET /regulation_bases/1
  # GET /regulation_bases/1.xml
  def show
    @regulation_basis = RegulationBasis.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @regulation_basis }
    end
  end

  # GET /regulation_bases/new
  # GET /regulation_bases/new.xml
  def new
    @regulation_basis = RegulationBasis.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @regulation_basis }
    end
  end

  # GET /regulation_bases/1/edit
  def edit
    @regulation_basis = RegulationBasis.find(params[:id])
  end

  # POST /regulation_bases
  # POST /regulation_bases.xml
  def create  
    @regulation_basis = RegulationBasis.new(params[:regulation_basis])

    respond_to do |format|
      if @regulation_basis.save
        add_to_log(t('Regulation basis create log') + @regulation_basis.name,"regulation_basis","create")
        flash[:notice] = t('Regulation basis created')
        format.html { redirect_to(@regulation_basis) }
        format.xml  { render :xml => @regulation_basis, :status => :created, :location => @regulation_basis }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @regulation_basis.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /regulation_bases/1
  # PUT /regulation_bases/1.xml
  def update
    @regulation_basis = RegulationBasis.find(params[:id])

    respond_to do |format|
      if @regulation_basis.update_attributes(params[:regulation_basis])
        add_to_log(t('Regulation basis updated log') + @regulation_basis.name,"regulation_basis","update")
        flash[:notice] = t('Regulation basis updated')
        format.html { redirect_to(@regulation_basis) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @regulation_basis.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /regulation_bases/1
  # DELETE /regulation_bases/1.xml
  def destroy
    @regulation_basis = RegulationBasis.find(params[:id])
    @regulation_basis.destroy
    add_to_log(t('Regulation basis destroy log') + @regulation_basis.name,"regulation_basis","destroy")

    respond_to do |format|
      format.html { redirect_to(regulation_bases_url) }
      format.xml  { head :ok }
    end
  end
end
