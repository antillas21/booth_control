class AddIndexToRfcInOffice < ActiveRecord::Migration
  def self.up
    add_index :offices, :rfc
  end

  def self.down
    remove_index :offices, :rfc
  end
end
