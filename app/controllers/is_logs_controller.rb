class IsLogsController < ApplicationController
  
  include AuthenticatedSystem
  layout 'ceslet' 

  before_filter :login_required 
  
  # GET /is_logs
  # GET /is_logs.xml
  def index
    @is_logs = IsLog.all(:order => "created_at desc")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @is_logs }
    end
  end

  # GET /is_logs/1
  # GET /is_logs/1.xml
  def show
    @is_log = IsLog.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @is_log }
    end
  end

  # GET /is_logs/new
  # GET /is_logs/new.xml
  def new
    @is_log = IsLog.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @is_log }
    end
  end

  # GET /is_logs/1/edit
  def edit
    @is_log = IsLog.find(params[:id])
  end

  # POST /is_logs
  # POST /is_logs.xml
  def create
    @is_log = IsLog.new(params[:is_log])

    respond_to do |format|
      if @is_log.save
        flash[:notice] = 'IsLog was successfully created.'
        format.html { redirect_to(@is_log) }
        format.xml  { render :xml => @is_log, :status => :created, :location => @is_log }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @is_log.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /is_logs/1
  # PUT /is_logs/1.xml
  def update
    @is_log = IsLog.find(params[:id])

    respond_to do |format|
      if @is_log.update_attributes(params[:is_log])
        flash[:notice] = 'IsLog was successfully updated.'
        format.html { redirect_to(@is_log) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @is_log.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /is_logs/1
  # DELETE /is_logs/1.xml
  def destroy
    @is_log = IsLog.find(params[:id])
    @is_log.destroy

    respond_to do |format|
      format.html { redirect_to(is_logs_url) }
      format.xml  { head :ok }
    end
  end
end
