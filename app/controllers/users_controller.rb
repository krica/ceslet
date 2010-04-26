class UsersController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller instead
  include AuthenticatedSystem
  layout 'ceslet' 

  before_filter :login_required 
  def main
    
  end

  # render new.rhtml
  def new
    only_admin
    @user = User.new
    @groups = Group.find(:all)
  end
 
  def create
    only_admin
    @user = User.new(params[:user])
    if params[:groups]
      params[:groups].each do |id|
        @user.groups << Group.find(id)
      end
    end
    success = @user && @user.save
    if success && @user.errors.empty?
            # Protects against session fixation attacks, causes request forgery
      # protection if visitor resubmits an earlier form using back
      # button. Uncomment if you understand the tradeoffs.
      # reset session
      add_to_log(t('User created log'),"users","create")
      redirect_to :action => :index
      flash[:notice] = t('Sign up successfull')
    else
      flash[:error]  = t('Sign up unsuccessfull')
      render :action => 'new'
    end
  end

  def show
    only_admin
    @user = User.find(params[:id]) 
  end

  def index
    only_admin
    @users = User.find(:all, :order => :lastname)
  end

  def edit
    only_admin
    @user = User.find(params[:id])
  end

  def update
    only_admin
    @user = User.find(params[:id])
    @user.groups.delete_all
    if params[:groups]
      params[:groups].each do |id|
        @user.groups << Group.find(id)
      end
    end
    respond_to do |format|
      if @user.update_attributes(params[:user])
        flash[:notice] = t('User updated')
        format.html { redirect_to(@user) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    only_admin
    @user = User.find(params[:id])
    @user.destroy
    add_to_log(t('User created log'),"users","destroy")
    if params[:groups]
      params[:groups].each do |id|
        @user.groups << Group.find(id)
      end
    end
    respond_to do |format|
      flash[:notice] = t('User destroyed')
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end
    
end
