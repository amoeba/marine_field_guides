class CreateNaturalHistories < ActiveRecord::Migration
  def self.up
    create_table :natural_histories do |t|
      t.integer :species_id
      t.text :value
      t.timestamps
    end
  end

  def self.down
    drop_table :natural_histories
  end
end
