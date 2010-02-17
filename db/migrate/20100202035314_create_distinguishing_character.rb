class CreateDistinguishingCharacter < ActiveRecord::Migration
  def self.up
    create_table :distinguishing_characters do |t|
      t.integer :species_id
      t.text :value
      t.timestamps
    end
  end

  def self.down
    drop_table :distinguishing_characters
  end
end
