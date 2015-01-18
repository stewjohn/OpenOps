class CreateAwsSubnets < ActiveRecord::Migration
  def change
    create_table :aws_subnets do |t|
      t.string :subnet_id
      t.string :state
      t.string :vpc_id
      t.string :cidr_block
      t.integer :available_ip_address_count
      t.string :availability_zone
      t.boolean :default_for_az
      t.boolean :map_public_ip_on_launch

      t.timestamps
    end
  end
end
