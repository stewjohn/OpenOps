class AddKeysToAwsVpc < ActiveRecord::Migration
  def change
    add_column :aws_vpcs, :aws_account_id, :string
    add_column :aws_vpcs, :aws_region_id, :integer
  end
end
