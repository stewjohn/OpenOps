class CreateAwsKeyPairs < ActiveRecord::Migration
  def change
    create_table :aws_key_pairs do |t|
      t.integer :aws_account_id
      t.integer :aws_region_id
      t.string :key_name
      t.string :key_fingerprint

      t.timestamps
    end
  end
end
