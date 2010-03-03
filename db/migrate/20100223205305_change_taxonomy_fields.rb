class ChangeTaxonomyFields < ActiveRecord::Migration
  def self.up
    add_column :taxonomies, :domain, :string
    add_column :taxonomies, :subkingdom, :string
    
    add_column :taxonomies, :superphylum, :string
    add_column :taxonomies, :subphylum, :string
    
    add_column :taxonomies, :superclass, :string
    add_column :taxonomies, :subclass, :string
    
    add_column :taxonomies, :superorder, :string
    add_column :taxonomies, :suborder, :string
    
    add_column :taxonomies, :superfamily, :string
    add_column :taxonomies, :subfamily, :string
    
    add_column :taxonomies, :genus, :string
    add_column :taxonomies, :species, :string
    
    add_column :taxonomies, :subspecies, :string
  end

  def self.down
    remove_column :taxonomies, :domain
    remove_column :taxonomies, :subkingdom
    
    remove_column :taxonomies, :superphylum
    remove_column :taxonomies, :subphylum
    
    remove_column :taxonomies, :superclass
    remove_column :taxonomies, :subclass
    
    remove_column :taxonomies, :superorder
    remove_column :taxonomies, :suborder
    
    remove_column :taxonomies, :superfamily
    remove_column :taxonomies, :subfamily
    
    remove_column :taxonomies, :genus
    remove_column :taxonomies, :species
    
    remove_column :taxonomies, :subspecies
  end
end
