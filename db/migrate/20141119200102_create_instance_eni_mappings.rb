class CreateInstanceEniMappings < ActiveRecord::Migration
  def change
    create_table :instance_eni_mappings do |t|
      t.string :instance_id
      t.string :network_interface_id

      t.timestamps
    end
  end
end
