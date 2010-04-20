module CertificationFeeTwosHelper
  #returns destroy link or info, depends if its used in offer
  def certification_fee_twos_destroy_link(fee)
    count = 0
    Offer.all.each do |offer|
      if offer.certification_fee_twos.include?(fee)
        count = count + 1
      end
    end
    if count == 0
      return link_to_with_icon('trash',t('Destroy') , fee, :confirm => t('Are you sure'), :method => :delete, :class => "fg-btn-small to-btn")
    else
      return link_to_with_icon('info',t('Offers count') + " " + count.to_s ,"#", :class => "fg-btn-small to-btn ui-state-disabled")
    end
  end
end
