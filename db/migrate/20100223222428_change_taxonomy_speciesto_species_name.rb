class ChangeTaxonomySpeciestoSpeciesName < ActiveRecord::Migration
  def self.up
    rename_column :taxonomies, :species, :species_name
  end

  def self.down
    rename_column :taxonomies, :species_name, :species
  end
end
