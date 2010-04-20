module GroupsHelper
  #renders destroy or no link depend its used in offer
  def group_destroy_link(group)
    count = 0
    User.all.each do |user|
      if user.groups.include?(group)
        count = count + 1
      end
    end
    if count == 0
      return link_to_with_icon('trash',t('Destroy'), group, :confirm => t('Are you sure'), :method => :delete, :class => "fg-btn-small to-btn")
    else
      return link_to_with_icon('info',t('Users count') + " " + count.to_s ,"#", :class => "fg-btn-small to-btn ui-state-disabled")
    end
  end
end
