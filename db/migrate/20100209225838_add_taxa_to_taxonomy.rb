class AddTaxaToTaxonomy < ActiveRecord::Migration
  def self.up
    add_column :taxonomy, :subphylum, :string
    add_column :taxonomy, :superclass, :string
    add_column :taxonomy, :subclass, :string
    add_column :taxonomy, :infraclass, :string
    add_column :taxonomy, :superorder, :string
    add_column :taxonomy, :infraorder, :string
    add_column :taxonomy, :subfamily, :string
    add_column :taxonomy, :subspecies, :string
  end

  def self.down
  end
end
