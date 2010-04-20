class Offer < ActiveRecord::Base


  has_and_belongs_to_many :certification_fee_twos
  belongs_to :aircraft

end
