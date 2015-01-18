class CreateAwsVpcs < ActiveRecord::Migration
  def change
    create_table :aws_vpcs do |t|
      t.string :vpc_id
      t.string :state
      t.string :cidr_block
      t.string :dhcp_options_id
      t.string :instance_default
      t.boolean :is_default

      t.timestamps
    end
  end
end
