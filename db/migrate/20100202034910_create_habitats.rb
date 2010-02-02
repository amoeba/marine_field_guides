class CreateHabitats < ActiveRecord::Migration
  def self.up
    create_table :habitats do |t|
      t.integer :species_id
      t.string :value
      t.timestamps
    end
  end

  def self.down
    drop_table :habitats
  end
end
