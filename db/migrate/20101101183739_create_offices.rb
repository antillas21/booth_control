class CreateOffices < ActiveRecord::Migration
  def self.up
    create_table :offices do |t|
      t.string :address1
      t.string :address2
      t.string :city
      t.integer :state_id
      t.string :zip
      t.integer :country_id
      t.string :rfc
      t.string :phone
      t.string :fax
      t.string :website
      t.integer :company_id

      t.timestamps
    end
    add_index :offices, :company_id
    add_index :offices, :country_id
    add_index :offices, :state_id
  end

  def self.down
    drop_table :offices
  end
end
