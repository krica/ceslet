module OffersHelper
  
  #returns select with active aircrafts
  def aircraft_select
    select :offer, :aircraft_id, Aircraft.find(:all, :conditions => {:active => true}).map {|a| [a.name, a.id]}
  end
  
  #returns table with certification fee one 
  def cer_fee_one
    ret = "<table id='cer-fee-one'>"
    ret << "<tr><th></th><th>#{t('fee type 1')}</th><th>#{t('fee type 2')}</th><th class='left-side'>#{t('fee type 3')}</th></tr>"
    CertificationFeeOne.find(:all, :conditions => {:active => true}).each do |fee|
      ret << "<tr>"
      ret << "<td>#{t(fee.kind)}<br>#{t(fee.mtow_kg)}</td>"
      if fee.fee_type == 'fee type 1'
        ret << "<td><input type='radio' name='offer[certification_fee_one_id]' value='#{fee.id.to_s}' />#{fee.value}</td><td></td><td class='left-side'></td>"
      elsif fee.fee_type == 'fee type 2'
        ret << "<td></td><td><input type='radio' name='offer[certification_fee_one_id]' value='#{fee.id.to_s}' />#{fee.value}</td><td class='left-side'></td>"
      elsif fee.fee_type == 'fee type 3'
        ret << "<td></td><td></td><td class='left-side'><input type='radio' name='offer[certification_fee_one_id]' value='#{fee.id.to_s}' />#{fee.value}</td>"
      end
      ret << "</tr>"
    end
    ret << "</table>"
    return ret
  end

  #returns checkboxes with certification fee twos
  def cer_fee_twos
    ret = ""
    CertificationFeeTwo.find(:all, :conditions => {:active => true}).each do |fee|
      ret << '<input type="checkbox" name="certification_fee_twos[]" value="'
      ret << fee.id.to_s
      ret << '"'
      if @offer && @offer.certification_fee_twos.include?(fee)
        ret << " checked"
      end
      ret << ' />'
      ret << "#{fee.kind} #{fee.description}<br />"
    end
    return ret

  end
  
  #returns planned visibility type select
  def planned_visibility_type_select
    select :offer, :planned_visibility_type, [[t('visibility 1'), 'visibility 1'], [t('visibility 2'), 'visibility 2'], [t('visibility 3'), 'visibility 3']]
  end
  
  #returns current visibility type select
  def current_visibility_type_select
    select :offer, :current_visibility_type, [[t('visibility 1'), 'visibility 1'], [t('visibility 2'), 'visibility 2'], [t('visibility 3'), 'visibility 3']]
  end
end
