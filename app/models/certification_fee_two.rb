class CertificationFeeTwo < ActiveRecord::Base


  has_and_belongs_to_many :offers

  validates_presence_of :kind
  validates_presence_of :description
end
