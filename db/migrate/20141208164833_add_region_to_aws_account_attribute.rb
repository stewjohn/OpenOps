class AddRegionToAwsAccountAttribute < ActiveRecord::Migration
  def change
    add_column :aws_account_attributes, :aws_region_id, :integer
  end
end
