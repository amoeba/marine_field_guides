class CreateSimilarSpecies < ActiveRecord::Migration
  def self.up
    create_table :similar_species do |t|
      t.integer :species_id
      t.integer :similar_species_id
      t.timestamps
    end
  end

  def self.down
    drop_table :similar_species
  end
end
