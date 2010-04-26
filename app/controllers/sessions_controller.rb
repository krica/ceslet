# This controller handles the login/logout function of the site.  
class SessionsController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller instead
  include AuthenticatedSystem
  
  layout 'ceslet'

  # render new.rhtml
  def new
  end

  def create
    logout_keeping_session!
    user = User.authenticate(params[:login], params[:password])
    if user
      # Protects against session fixation attacks, causes request forgery
      # protection if user resubmits an earlier form using back
      # button. Uncomment if you understand the tradeoffs.
      # reset_session
      self.current_user = user
      new_cookie_flag = (params[:remember_me] == "1")
      handle_remember_cookie! new_cookie_flag
      redirect_back_or_default('/')
      flash[:notice] = t("Logged in successfully")
      session_add_to_log(t('User succesfully logged in'),"session","new")
    else
      note_failed_signin
      @login       = params[:login]
      @remember_me = params[:remember_me]
      render :action => 'new'
    end
  end

  def destroy
    session_add_to_log(t('User succesfully logged out'),"session","destroy")
    logout_killing_session!
    flash[:notice] = t("You have been logged out")
    redirect_back_or_default('/sessions/new')
  end

protected

  
  def session_add_to_log(event, model_name = nil, action_name = nil)
    @log = IsLog.new()
    @log.event = event
    @log.user = self.current_user
    @log.model_name = model_name
    @log.action_name = action_name
    @log.save
  end

  # Track failed login attempts
  def note_failed_signin
    flash[:error] = "Couldn't log you in as '#{params[:login]}'"
    logger.warn "Failed login for '#{params[:login]}' from #{request.remote_ip} at #{Time.now.utc}"
  end
end
