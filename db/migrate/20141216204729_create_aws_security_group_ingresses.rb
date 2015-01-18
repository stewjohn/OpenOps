class CreateAwsSecurityGroupIngresses < ActiveRecord::Migration
  def change
    create_table :aws_security_group_ingresses do |t|
      t.string :security_group_id
      t.string :ingress_id
      t.string :ip_protocol
      t.integer :from_port
      t.integer :to_port

      t.timestamps
    end
  end
end
