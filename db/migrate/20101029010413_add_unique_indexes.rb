class AddUniqueIndexes < ActiveRecord::Migration
  def self.up
    add_index :booths, :code
    add_index :booths, :booth_number
    add_index :colors, :hex_value
    add_index :colors, :name
    add_index :exhibitor_types, :name
  end

  def self.down
    remove_index :booths, :code
    remove_index :booths, :booth_number
    remove_index :colors, :hex_value
    remove_index :colors, :name
    remove_index :exhibitor_types, :name
  end
end
