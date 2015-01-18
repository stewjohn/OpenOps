class CreateInstanceBlockDeviceMappings < ActiveRecord::Migration
  def change
    create_table :instance_block_device_mappings do |t|
      t.string :instance_id
      t.string :device_name
      t.string :volume_id

      t.timestamps
    end
  end
end
