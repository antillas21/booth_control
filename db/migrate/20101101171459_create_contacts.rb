class CreateContacts < ActiveRecord::Migration
  def self.up
    create_table :contacts do |t|
      t.string :name
      t.string :email
      t.integer :company_id

      t.timestamps
    end
    add_index :contacts, :company_id
  end

  def self.down
    drop_table :contacts
  end
end
