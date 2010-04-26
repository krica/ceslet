# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details


  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  
  
  private
  
  def add_to_log(event, model_name = nil, action_name = nil)
    @log = IsLog.new()
    @log.event = event
    @log.user = current_user
    @log.model_name = model_name
    @log.action_name = action_name
    @log.save
  end

  def only_admin
    if !current_user.has_role?("admin")
      flash[:notice] = t('No_right')
      redirect_to "/"
    end
  end
end
