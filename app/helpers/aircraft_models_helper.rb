module AircraftModelsHelper
  
  #return destroy link or not depends if its in aircraft
  def model_destroy_link(aircraft_model)
    c = 0
    Aircraft.all.each do |aircraft|
      if aircraft.aircraft_model_id == aircraft_model.id
        c = c + 1
      end
    end
    if c == 0
      return link_to_with_icon('trash',t('Destroy') , aircraft_model, :confirm => t('Are you sure'), :method => :delete, :class => "fg-btn-small to-btn")
    else
      return link_to_with_icon('info',t('Aircrafts count') + " " + c.to_s ,"#", :class => "fg-btn-small to-btn ui-state-disabled")
    end
  end

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
