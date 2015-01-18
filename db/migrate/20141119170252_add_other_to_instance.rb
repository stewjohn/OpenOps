class AddOtherToInstance < ActiveRecord::Migration
  def change
    add_column :instances, :launch_time, :datetime
    add_column :instances, :subnet_id, :string
    add_column :instances, :vpc_id, :string
    add_column :instances, :private_ip_address, :string
    add_column :instances, :public_ip_address, :string
    add_column :instances, :architecture, :string
    add_column :instances, :root_device_type, :string
    add_column :instances, :root_device_name, :string
    add_column :instances, :virtualization_type, :string
    add_column :instances, :client_token, :string
    add_column :instances, :source_dest_check, :boolean
    add_column :instances, :hypervisor, :string
    add_column :instances, :ebs_optimized, :boolean
  end
end
