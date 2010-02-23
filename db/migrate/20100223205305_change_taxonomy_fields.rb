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
    drop_column :taxonomies, :domain
    drop_column :taxonomies, :subkingdom
    
    drop_column :taxonomies, :superphylum
    drop_column :taxonomies, :subphylum
    
    drop_column :taxonomies, :superclass
    drop_column :taxonomies, :subclass
    
    drop_column :taxonomies, :superorder
    drop_column :taxonomies, :suborder
    
    drop_column :taxonomies, :superfamily
    drop_column :taxonomies, :subfamily
    
    drop_column :taxonomies, :genus
    drop_column :taxonomies, :species
    
    drop_column :taxonomies, :subspecies
  end
end
