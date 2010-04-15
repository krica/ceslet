module AircraftModelsHelper

  def add_type_link
    link_to t('Add new type'), "#", :id => 'add-type-link', :class => "fg-btn-small to-btn", :onclick => "$('#add-type').slideDown('fast');$(this).hide();"
  end

  def hide_add_type_link
    link_to t('Back'), "#", :class => "fg-button to-btn", :onclick => "$('#add-type').slideUp('fast');$('#add-type-link').show();"
  end

  def model_select_type
    select(:partial, :aircraft_type_id, AircraftType.find(:all).map {|t| [t.name, t.id]})
  end

  def type_select_new(type)
    select :type, :id, AircraftType.all.map {|t| [t.name, t.id]},{:selected => type.id}, :onchange => remote_function(:update => "select-model-new", :url => {:action => :update_model, :controller => :aircrafts}, :with => "'type_id=' + $('#type_id option:selected').val()")
  end

  def xxx_type_select_new(type)
     select :aircraft, :type_id, AircraftType.all.map {|t| [t.name, t.id]},{}, :onchange => remote_function(:update => "select-model-new", :url => {:action => :update_model}, :with => "'type_id=' + $('#aircraft_type_id option:selected').val()"), :selected => type.id
  end
  def add_model_link
    link_to t('Add new model'), "#", :id => 'add-model-link', :class => "fg-btn-small to-btn", :onclick => "$('#add-model').slideDown('fast');$(this).hide();"
  end
end
