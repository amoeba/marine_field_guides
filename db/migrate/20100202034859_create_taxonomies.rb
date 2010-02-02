class CreateTaxonomies < ActiveRecord::Migration
  def self.up
    create_table :taxonomies do |t|
      t.integer :species_id
      t.string :kingdom
      t.string :phylum
      t.string :class
      t.string :order
      t.string :family
      t.timestamps
    end
  end

  def self.down
    drop_table :taxonomies
  end
end
