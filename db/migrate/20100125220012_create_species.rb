class CreateSpecies < ActiveRecord::Migration
  def self.up
    create_table :species do |t|
      t.string :scientific_name
      t.common_names :string
      t.timestamps
    end
  end

  def self.down
    drop_table :species
  end
end
