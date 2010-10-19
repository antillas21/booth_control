class CreateExhibitorTypes < ActiveRecord::Migration
  def self.up
    create_table :exhibitor_types do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :exhibitor_types
  end
end
