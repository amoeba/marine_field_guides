class CreateAbundances < ActiveRecord::Migration
  def self.up
    create_table :abundances do |t|
      t.integer :species_id
      t.string :value
      t.timestamps
    end
  end

  def self.down
    drop_table :abundances
  end
end
