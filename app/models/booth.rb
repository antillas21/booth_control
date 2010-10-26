class Booth < ActiveRecord::Base
  attr_accessible :code, :color_id, :booth_number, :available
  validates_presence_of :code, :color_id, :booth_number
  validates_uniqueness_of :code, :booth_number
  
  belongs_to :color
  
  def color_name
    color.name if color
  end
  
  def color_name=(name)
    self.color = Color.find_by_name(name) unless name.blank?
  end
end
