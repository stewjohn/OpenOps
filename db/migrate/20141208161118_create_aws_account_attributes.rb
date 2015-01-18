class CreateAwsAccountAttributes < ActiveRecord::Migration
  def change
    create_table :aws_account_attributes do |t|
      t.integer :aws_account_id
      t.string :attribute_name
      t.string :attribute_value

      t.timestamps
    end
  end
end
