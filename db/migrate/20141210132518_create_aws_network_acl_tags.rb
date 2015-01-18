class CreateAwsNetworkAclTags < ActiveRecord::Migration
  def change
    create_table :aws_network_acl_tags do |t|
      t.string :network_acl_id
      t.string :key
      t.string :value

      t.timestamps
    end
  end
end
