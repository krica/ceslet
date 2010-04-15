module AircraftsHelper

  def add_model_link
    link_to t('Add new model'), "#", :id => 'add-model-link', :class => "fg-btn-small to-btn model-link", :onclick => "$('#add-model').slideDown('fast');$(this).hide();"
  end

  def hide_add_model_link
    link_to t('Back'), "#", :class => "fg-button to-btn", :onclick => "$('#add-model').slideUp('fast');$('#add-model-link').show();"
  end

  def type_select
     select :aircraft_type, :id, AircraftType.all.map {|t| [t.name, t.id]},{}, :onchange => remote_function(:update => "select-model-new", :url => {:action => :update_model}, :with => "'type_id=' + $('#aircraft_type_id option:selected').val()")
  end
end
