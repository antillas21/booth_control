class CreateCompanies < ActiveRecord::Migration
  def self.up
    create_table :companies do |t|
      t.string :name
      t.text :profile
      t.integer :exhibitor_type_id
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :companies
  end
end
