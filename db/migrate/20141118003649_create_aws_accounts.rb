class CreateAwsAccounts < ActiveRecord::Migration
  def change
    create_table :aws_accounts do |t|
      t.string :account_name
      t.integer :environment_id
      t.string :access_key_id
      t.string :secrete_access_key

      t.timestamps
    end
  end
end
