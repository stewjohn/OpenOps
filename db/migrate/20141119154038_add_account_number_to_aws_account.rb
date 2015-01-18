class AddAccountNumberToAwsAccount < ActiveRecord::Migration
  def change
    add_column :aws_accounts, :account_number, :string
  end
end
