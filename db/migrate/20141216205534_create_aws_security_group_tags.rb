class CreateAwsSecurityGroupTags < ActiveRecord::Migration
  def change
    create_table :aws_security_group_tags do |t|
      t.string :security_group_id
      t.string :key
      t.string :value

      t.timestamps
    end
  end
end
