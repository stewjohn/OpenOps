class CreateInstanceEniTags < ActiveRecord::Migration
  def change
    create_table :instance_eni_tags do |t|
      t.string :network_interface_id
      t.string :key
      t.string :value

      t.timestamps
    end
  end
end
