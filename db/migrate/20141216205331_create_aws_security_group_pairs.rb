class CreateAwsSecurityGroupPairs < ActiveRecord::Migration
  def change
    create_table :aws_security_group_pairs do |t|
      t.string :security_group_id
      t.string :permission_set_id
      t.string :user_id
      t.string :group_name
      t.string :group_id

      t.timestamps
    end
  end
end
