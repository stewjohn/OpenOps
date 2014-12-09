class CreateAwsElasticIps < ActiveRecord::Migration
  def change
    create_table :aws_elastic_ips do |t|
      t.integer :aws_account_id
      t.integer :aws_region_id
      t.string :instance_id
      t.string :public_ip
      t.string :allocation_id
      t.string :association_id
      t.string :domain
      t.string :network_interface_id
      t.string :network_interface_owner_id
      t.string :private_ip_address

      t.timestamps
    end
  end
end
