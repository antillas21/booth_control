class CreateMaps < ActiveRecord::Migration
  def self.up
    create_table :maps do |t|
      t.string :map_file
      t.string :zoom
      t.string :zoom_x
      t.string :zoom_y

      t.timestamps
    end
  end

  def self.down
    drop_table :maps
  end
end
