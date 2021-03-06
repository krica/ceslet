class Aircraft < ActiveRecord::Base


  belongs_to :aircraft_model
  has_many :offers
  validates_presence_of :serial_number
  validates_uniqueness_of :serial_number
  validates_presence_of :aircraft_model_id
  validates_presence_of :matriculation

  #returns type and model name
  def name
    ret = ""
    if self.aircraft_model
      if self.aircraft_model.aircraft_type
        ret << self.aircraft_model.aircraft_type.name
        ret << " "
        ret << self.aircraft_model.name
      else
        ret << self.aircraft_model.name
      end
    end
    ret << " - " + self.matriculation
    return ret
  end

  #returns operator company name if present
  def operator_name
    if self.operator_id && @operator = Company.find(self.operator_id)
      return @operator.name
    else
      return ""
    end
  end
  
  #returns operator company ico if present
  def operator_ico
    if self.operator_id && @operator = Company.find(self.operator_id)
      return @operator.ico
    else
      return ""
    end
  end
  
  #returns operator company dic if present
  def operator_dic
    if self.operator_id && @operator = Company.find(self.operator_id)
      return @operator.dic
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
  
  #returns owner company ico if present
  def owner_ico
    if self.owner_id && @owner = Company.find(self.owner_id)
      return @owner.ico
    else
      return ""
    end
  end

  #returns owner company dic if present
  def owner_dic
    if self.owner_id && @owner = Company.find(self.owner_id)
      return @owner.dic
    else
      return ""
    end
  end

end
