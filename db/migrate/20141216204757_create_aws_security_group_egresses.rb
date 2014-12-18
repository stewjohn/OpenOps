class CreateAwsSecurityGroupEgresses < ActiveRecord::Migration
  def change
    create_table :aws_security_group_egresses do |t|
      t.string :security_group_id
      t.string :egress_id
      t.string :ip_protocol
      t.integer :from_port
      t.integer :to_port

      t.timestamps
    end
  end
end
