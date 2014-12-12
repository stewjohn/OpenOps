class RemoveEnviromentIdFromAwsAccount < ActiveRecord::Migration
  def change
    remove_column :aws_accounts, :environment_id, :integer
  end
end
