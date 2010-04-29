class CertificationFeeOne < ActiveRecord::Base
  
  validates_presence_of :mtow_kg
  validates_presence_of :fee_type
  validates_presence_of :kind
  validates_presence_of :value

  def display
    ret = "#{I18n.t(self.kind)} #{I18n.t(self.mtow_kg)} #{I18n.t(self.fee_type)} #{self.value} EUR"
    return ret
  end
end
