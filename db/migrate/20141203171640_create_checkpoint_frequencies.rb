class CreateCheckpointFrequencies < ActiveRecord::Migration
  def change
    create_table :checkpoint_frequencies do |t|
      t.string :name
      t.integer :hours_apart

      t.timestamps
    end
  end
end
