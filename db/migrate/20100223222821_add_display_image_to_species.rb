class AddDisplayImageToSpecies < ActiveRecord::Migration
  def self.up
    add_column :species, :display_image, :integer
  end

  def self.down
    remove_column :species, :display_image
  end
end
