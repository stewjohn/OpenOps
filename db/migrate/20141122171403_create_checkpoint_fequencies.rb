class CreateCheckpointFequencies < ActiveRecord::Migration
  def change
    create_table :checkpoint_fequencies do |t|
      t.string :name
      t.integer :hours_apart

      t.timestamps
    end
  end
end
