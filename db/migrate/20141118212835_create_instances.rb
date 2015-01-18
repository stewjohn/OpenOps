class CreateInstances < ActiveRecord::Migration
  def change
    create_table :instances do |t|
      t.integer :host_id
      t.string :instance_id
      t.string :owner_id
      t.integer :state_code
      t.string :state
      t.string :key_name
      t.boolean :monitoring
      t.string :instance_type

      t.timestamps
    end
  end
end
