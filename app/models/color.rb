class Color < ActiveRecord::Base
  attr_accessible :name, :hex_value
  
  has_many :booths
end
