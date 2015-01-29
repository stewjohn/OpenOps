class AddVpcIdToAwsSecurityGroup < ActiveRecord::Migration
  def change
    add_column :aws_security_groups, :vpc_id, :string
  end
end
