class UsersController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller instead
  before_filter :login_required, :only => [:edit, :show] 
  
  include AuthenticatedSystem
  layout 'ceslet' 

  # render new.rhtml
  def new
    if !current_user.has_role?("admin")
      flash[:notice] = t('No_right')
      redirect_to "/"
    end
    @user = User.new
    
  end
 
  def create
    logout_keeping_session!
    @user = User.new(params[:user])
    success = @user && @user.save
    if success && @user.errors.empty?
            # Protects against session fixation attacks, causes request forgery
      # protection if visitor resubmits an earlier form using back
      # button. Uncomment if you understand the tradeoffs.
      # reset session
      self.current_user = @user # !! now logged in
      redirect_back_or_default('/')
      flash[:notice] = t('sign up successfull')
    else
      flash[:error]  = t('sign up unsuccessfull')
      render :action => 'new'
    end
  end

  def show
    @user = current_user   
  end
end
