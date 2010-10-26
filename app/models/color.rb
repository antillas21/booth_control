class Color < ActiveRecord::Base
  attr_accessible :name, :hex_value
  validates_presence_of :name, :hex_value
  validates_uniqueness_of :hex_value, :name
  
  has_many :booths
end
