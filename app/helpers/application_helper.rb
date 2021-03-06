# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  #renders back link
  def back_link(path)
   link_to_with_icon('circle-triangle-w', t('Back'), path,
     :class=>"fg-button to-btn")
  end  
  
  #renders login button
  def login_button
    if session[:user_id]
      link_to_with_icon('key',t('logout_button'), {:controller => :sessions, :action => :destroy}, :class => "login-button to-btn fg-button")
    end
  end
  
  #renders link with icon
  def wrap_with_icon(link, icon)
    content_tag(:span, '', :style => 'float: left; margin-right: 0.3em; margin-left: -5px',
                :class => "ui-icon ui-icon-%s" % icon) + link
  end
  
  #adds arguments to link
  def link_to_with_icon(icon, link, *args)
    link = wrap_with_icon(link, icon)
    link_to link, *args
  end
  
end
