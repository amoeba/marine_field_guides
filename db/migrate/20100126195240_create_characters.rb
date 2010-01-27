class CreateCharacters < ActiveRecord::Migration
  def self.up
    create_table :characters do |t|
      t.integer :species_id
      t.string :name
      t.string :value
      t.string :unit
      t.timestamps
    end
  end

  def self.down
    drop_table :characters
  end
end
