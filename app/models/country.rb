class Country < ActiveRecord::Base
  attr_accessible :name
  
  validates_presence_of :name
  validates_uniqueness_of :name
  
  has_many :offices
  
  scope :ordered, order("name asc")
end
