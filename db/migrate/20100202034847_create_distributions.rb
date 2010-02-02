class CreateDistributions < ActiveRecord::Migration
  def self.up
    create_table :distributions do |t|
      t.integer :species_id
      t.string :value
      t.timestamps
    end
  end

  def self.down
    drop_table :distributions
  end
end
