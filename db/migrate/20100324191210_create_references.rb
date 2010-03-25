class CreateReferences < ActiveRecord::Migration
  def self.up
    create_table :references do |t|
      t.integer :species_id
      t.text :value
      t.timestamps
    end
  end

  def self.down
    drop_table :references
  end
end
