class CreateReservations < ActiveRecord::Migration
  def self.up
    create_table :reservations do |t|
      t.integer :company_id
      t.integer :booth_id

      t.timestamps
    end
    
    add_index :reservations, :company_id
    add_index :reservations, :booth_id
  end

  def self.down
    drop_table :reservations
  end
end
