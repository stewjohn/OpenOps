class CreateAwsSecurityGroupRanges < ActiveRecord::Migration
  def change
    create_table :aws_security_group_ranges do |t|
      t.string :security_group_id
      t.string :permission_set_id
      t.string :cidr_ip

      t.timestamps
    end
  end
end
