class Company < ActiveRecord::Base
  attr_accessible :name, :profile, :exhibitor_type_id, :user_id
  
  validates_presence_of :name, :profile, :exhibitor_type_id
  validates_uniqueness_of :name
  
  belongs_to :user
  belongs_to :exhibitor_type
end
