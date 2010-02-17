class AddMorphToCharacterTraits < ActiveRecord::Migration
  def self.up
    add_column :characters, :morph, :string
  end

  def self.down
    remove_column :characters, :morph
  end
end
