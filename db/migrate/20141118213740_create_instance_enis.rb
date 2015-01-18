class CreateInstanceEnis < ActiveRecord::Migration
  def change
    create_table :instance_enis do |t|
      t.integer :host_id
      t.string :instance_id
      t.string :network_interface_id
      t.string :subnet_id
      t.string :vpc_id
      t.string :owner_id
      t.string :status
      t.string :mac_address
      t.boolean :source_dest_check
      t.string :attachment_id
      t.datetime :attach_date_time
      t.string :public_ip
      t.string :public_dns_name
      t.string :private_ip_address
      t.string :private_dns_name

      t.timestamps
    end
  end
end
