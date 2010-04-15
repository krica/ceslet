# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details


  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  
  
  private

  def only_admin
    if !current_user.has_role?("admin")
      flash[:notice] = t('No_right')
      redirect_to "/"
    end
  end
end
