module CompaniesHelper
  #returns destroy link or info, depends if its used in offer
  def company_destroy_link(company)
    count = 0
    Aircraft.all.each do |aircraft|
      if aircraft.owner_id == company.id || aircraft.operator_id == company.id
        count = count + 1
      end
    end
    if count == 0 && current_user.has_role?("admin")
      return link_to_with_icon('trash',t('Destroy') , company, :confirm => t('Are you sure'), :method => :delete, :class => "fg-btn-small to-btn")
    else
      return link_to_with_icon('info',t('Aircrafts count') + " " + count.to_s ,"#", :class => "fg-btn-small to-btn ui-state-disabled")
    end
  end
end
