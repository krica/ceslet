class Aircraft < ActiveRecord::Base


  belongs_to :aircraft_model


  #returns operator company name if present
  def operator_name
    if self.operator_id && @operator = Company.find(self.operator_id)
      return @operator.name
    else
      return ""
    end
  end

  #returns owner company name if present
  def owner_name
    if self.owner_id && @owner = Company.find(self.owner_id)
      return @owner.name
    else
      return ""
    end
  end
end
