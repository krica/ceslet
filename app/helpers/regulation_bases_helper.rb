module RegulationBasesHelper
  #retu
  #returns destroy link or info, depends if its used in offer
  def regulation_basis_destroy_link(regulation_basis)
    count = 0
    Offer.all.each do |offer|
      if offer.regulation_basis == regulation_basis
        count = count + 1
      end
    end
    if count == 0
      return link_to_with_icon('trash',t('Destroy') , regulation_basis, :confirm => t('Are you sure'), :method => :delete, :class => "fg-btn-small to-btn")
    else
      return link_to_with_icon('info',t('Offers count') + " " + count.to_s ,"#", :class => "fg-btn-small to-btn ui-state-disabled")
    end
  end
end
