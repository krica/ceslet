module AircraftTypesHelper

  #return destroy link or info, depends if its used in models
  def type_destroy_link(aircraft_type)
    count = 0
    AircraftModel.all.each do |model|
      if model.aircraft_type_id == aircraft_type.id
        count = count + 1
      end
    end
    if count == 0
      return link_to_with_icon('trash',t('Destroy') , aircraft_type, :confirm => t('Are you sure'), :method => :delete, :class => "fg-btn-small to-btn")
    else
      return link_to_with_icon('info',t('Types count') + " " + count.to_s ,"#", :class => "fg-btn-small to-btn ui-state-disabled")
    end
  end
end
