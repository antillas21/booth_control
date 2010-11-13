class Reservation < ActiveRecord::Base
  attr_accessible :booth_id, :company_id, :booth_number
  
  validates_presence_of :booth_id, :company_id
  validates_uniqueness_of :booth_id
  
  belongs_to :booth
  belongs_to :company
  
  def booth_number
    booth.booth_number if booth
  end
  
  def booth_number=(booth_number)
    self.booth = Booth.find_by_booth_number(booth_number) unless booth_number.blank?
  end
  
end
