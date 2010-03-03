class RemoveScientificNameFromSpecies < ActiveRecord::Migration
  def self.up
    remove_column :species, :scientific_name
  end

  def self.down
    add_column :species, :scientific_name, :string
  end
end
