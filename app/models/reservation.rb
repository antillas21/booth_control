class Reservation < ActiveRecord::Base
  attr_accessible :booth_id, :company_id
  
  validates_presence_of :booth_id, :company_id
  validates_uniqueness_of :booth_id
  
  belongs_to :booth
  belongs_to :company
end
