module AircraftsHelper

  #returns destroy link or info, depends if its used in offer
  def aircraft_destroy_link(aircraft)
    count = 0
    Offer.all.each do |offer|
      if offer.aircraft_id == aircraft.id
        count = count + 1
      end
    end
    if count == 0
      return link_to_with_icon('trash',t('Destroy') , aircraft, :confirm => t('Are you sure'), :method => :delete, :class => "fg-btn-small to-btn")
    else
      return link_to_with_icon('info',t('Offers count') + " " + count.to_s ,"#", :class => "fg-btn-small to-btn ui-state-disabled")
    end
  end

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
