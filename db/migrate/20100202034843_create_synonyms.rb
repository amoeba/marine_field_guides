class CreateSynonyms < ActiveRecord::Migration
  def self.up
    create_table :synonyms do |t|
      t.integer :species_id
      t.string :value
      t.timestamps
    end
  end

  def self.down
    drop_table :synonyms
  end
end
