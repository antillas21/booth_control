class AddIndexesToBoothAndCompaniesModels < ActiveRecord::Migration
  def self.up
    add_index :booths, :color_id
    add_index :companies, :exhibitor_type_id
    add_index :companies, :user_id
  end

  def self.down
    remove_index :booths, :color_id
    remove_index :companies, :exhibitor_type_id
    remove_index :companies, :user_id
  end
end
