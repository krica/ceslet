class Group < ActiveRecord::Base

  has_and_belongs_to_many :users


  validates_presence_of :abbreviation
  validates_presence_of :name
end
