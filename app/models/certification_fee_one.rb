class CertificationFeeOne < ActiveRecord::Base


  def display
    ret = "#{I18n.t(self.kind)} #{I18n.t(self.mtow_kg)} #{I18n.t(self.fee_type)} #{self.value} EUR"
    return ret
  end
end
