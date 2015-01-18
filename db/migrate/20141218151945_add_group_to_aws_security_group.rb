class AddGroupToAwsSecurityGroup < ActiveRecord::Migration
  def change
    add_column :aws_security_groups, :aws_account_id, :integer
    add_column :aws_security_groups, :aws_region_id, :integer
  end
end
