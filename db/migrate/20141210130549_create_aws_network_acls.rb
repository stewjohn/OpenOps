class CreateAwsNetworkAcls < ActiveRecord::Migration
  def change
    create_table :aws_network_acls do |t|
      t.integer :aws_account_id
      t.integer :aws_region_id
      t.string :network_acl_id
      t.string :association_id
      t.string :association_acl_id
      t.string :association_subnet_id

      t.timestamps
    end
  end
end
