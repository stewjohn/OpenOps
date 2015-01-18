class CreateAwsNetworkAclEntries < ActiveRecord::Migration
  def change
    create_table :aws_network_acl_entries do |t|
      t.string :network_acl_id
      t.integer :rule_number
      t.string :protocol
      t.string :rule_action
      t.boolean :egress
      t.string :cidr_block
      t.integer :icmp_type_code
      t.integer :port_range_from
      t.integer :port_range_to

      t.timestamps
    end
  end
end
