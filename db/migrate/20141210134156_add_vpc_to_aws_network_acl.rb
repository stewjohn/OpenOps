class AddVpcToAwsNetworkAcl < ActiveRecord::Migration
  def change
    add_column :aws_network_acls, :vpc_id, :string
  end
end
