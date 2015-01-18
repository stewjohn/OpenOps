class AddAccountToEnvironment < ActiveRecord::Migration
  def change
    add_column :environments, :aws_account_id, :integer
  end
end
