class CreateCommonNames < ActiveRecord::Migration
  def self.up
    create_table :common_names do |t|
      t.integer :species_id
      t.string :value
      t.timestamps
    end
  end

  def self.down
    drop_table :common_names
  end
end
