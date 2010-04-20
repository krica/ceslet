module ClassificationsHelper
  
  #returns destroy link or info, depends if its used in offer
  def classification_destroy_link(classification)
    count = 0
    Offer.all.each do |offer|
      if offer.classification == classification
        count = count + 1
      end
    end
    if count == 0
      return link_to_with_icon('trash',t('Destroy') , classification, :confirm => t('Are you sure'), :method => :delete, :class => "fg-btn-small to-btn")
    else
      return link_to_with_icon('info',t('Offers count') + " " + count.to_s ,"#", :class => "fg-btn-small to-btn ui-state-disabled")
    end
  end
end
