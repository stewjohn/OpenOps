class CreateInstanceSecurityGroupMappings < ActiveRecord::Migration
  def change
    create_table :instance_security_group_mappings do |t|
      t.string :instance_id
      t.string :group_id

      t.timestamps
    end
  end
end
