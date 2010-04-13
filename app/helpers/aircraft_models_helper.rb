module AircraftModelsHelper

  def add_type_link
    link_to t('Add new type'), "#", :id => 'add-type-link', :class => "fg-btn-small to-btn", :onclick => "$('#add-type').slideDown('fast');$(this).hide();"
  end

  def hide_add_type_link
    link_to t('Back'), "#", :class => "fg-button to-btn", :onclick => "$('#add-type').slideUp('fast');$('#add-type-link').show();"
  end

end
