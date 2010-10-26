class AddCodeToBooths < ActiveRecord::Migration
  def self.up
    add_column :booths, :code, :string
  end

  def self.down
    remove_column :booths, :code
  end
end
