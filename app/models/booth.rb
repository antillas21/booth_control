class Booth < ActiveRecord::Base
  attr_accessible :code, :color_id, :booth_number, :available
  validates_presence_of :code, :color_id, :booth_number
  validates_uniqueness_of :code, :booth_number
  
  belongs_to :color
  delegate :hex_value, :to => :color, :prefix => true
  
  has_one :reservation
  has_one :company, :through => :reservation
  delegate :name, :profile, :to => :company, :prefix => true
  
  scope :free, where(:available => true)
  
  def color_name
    color.name if color
  end
  
  def color_name=(name)
    self.color = Color.find_by_name(name) unless name.blank?
  end
end
