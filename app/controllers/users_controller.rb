class UsersController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller instead
  before_filter :login_required, :only => [:edit, :show, :index, :destroy, :update] 
  
  include AuthenticatedSystem
  layout 'ceslet' 

  def main
    
  end

  # render new.rhtml
  def new
    @user = User.new
    @groups = Group.find(:all)
  end
 
  def create
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
      redirect_to :action => :index
      flash[:notice] = t('Sign up successfull')
    else
      flash[:error]  = t('Sign up unsuccessfull')
      render :action => 'new'
    end
  end

  def show
    @user = User.find(params[:id]) 
  end

  def index
    only_admin
    @users = User.find(:all)
  end

  def edit
    only_admin
    @user = User.find(params[:id])
  end

  def update
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
    

  private

  def only_admin
    if !current_user.has_role?("admin")
      flash[:notice] = t('No_right')
      redirect_to "/"
    end
  end

end
