class CreateBooths < ActiveRecord::Migration
  def self.up
    create_table :booths do |t|
      t.string :booth_number
      t.integer :color_id
      t.boolean :available

      t.timestamps
    end
  end

  def self.down
    drop_table :booths
  end
end
