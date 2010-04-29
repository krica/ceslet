class Offer < ActiveRecord::Base


  has_and_belongs_to_many :certification_fee_twos
  belongs_to :aircraft
  belongs_to :classification
  belongs_to :certification_fee_one
  belongs_to :regulation_basis

  validates_presence_of :aircraft_id
  validates_presence_of :order_number
  validates_uniqueness_of :order_number
  validates_presence_of :certification_fee_one_id
end
