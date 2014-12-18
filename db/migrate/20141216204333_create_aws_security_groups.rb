class CreateAwsSecurityGroups < ActiveRecord::Migration
  def change
    create_table :aws_security_groups do |t|
      t.string :owner_id
      t.text :group_name
      t.string :group_id
      t.text :description

      t.timestamps
    end
  end
end
