class AddTaxnameToOffices < ActiveRecord::Migration
  def self.up
    add_column :offices, :taxname, :string
  end

  def self.down
    remove_column :offices, :taxname
  end
end
