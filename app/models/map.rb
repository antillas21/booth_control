class Map < ActiveRecord::Base
  attr_accessible :map_file, :zoom, :zoom_x, :zoom_y
  validates_presence_of :map_file, :zoom, :zoom_x, :zoom_y
end
