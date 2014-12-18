# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20141218174217) do

  create_table "aws_account_attributes", force: true do |t|
    t.integer  "aws_account_id"
    t.string   "attribute_name"
    t.string   "attribute_value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "aws_region_id"
  end

  create_table "aws_accounts", force: true do |t|
    t.string   "account_name"
    t.string   "access_key_id"
    t.string   "secrete_access_key"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "account_number"
  end

  create_table "aws_azs", force: true do |t|
    t.integer  "aws_region_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state"
  end

  create_table "aws_dhcp_option_attributes", force: true do |t|
    t.string   "dhcp_options_id"
    t.string   "key"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "aws_dhcp_options", force: true do |t|
    t.integer  "aws_account_id"
    t.integer  "aws_region_id"
    t.string   "dhcp_options_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "aws_elastic_ips", force: true do |t|
    t.integer  "aws_account_id"
    t.integer  "aws_region_id"
    t.string   "instance_id"
    t.string   "public_ip"
    t.string   "allocation_id"
    t.string   "association_id"
    t.string   "domain"
    t.string   "network_interface_id"
    t.string   "network_interface_owner_id"
    t.string   "private_ip_address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "aws_internet_gateway_tags", force: true do |t|
    t.string   "internet_gateway_id"
    t.string   "key"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "aws_internet_gateways", force: true do |t|
    t.integer  "aws_account_id"
    t.integer  "aws_region_id"
    t.string   "internet_gateway_id"
    t.string   "attachment_vpc_id"
    t.string   "attachment_state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "aws_key_pairs", force: true do |t|
    t.integer  "aws_account_id"
    t.integer  "aws_region_id"
    t.string   "key_name"
    t.string   "key_fingerprint"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "aws_network_acl_entries", force: true do |t|
    t.string   "network_acl_id"
    t.integer  "rule_number"
    t.string   "protocol"
    t.string   "rule_action"
    t.boolean  "egress"
    t.string   "cidr_block"
    t.integer  "icmp_type_code"
    t.integer  "port_range_from"
    t.integer  "port_range_to"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "aws_network_acl_tags", force: true do |t|
    t.string   "network_acl_id"
    t.string   "key"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "aws_network_acls", force: true do |t|
    t.integer  "aws_account_id"
    t.integer  "aws_region_id"
    t.string   "network_acl_id"
    t.string   "association_id"
    t.string   "association_acl_id"
    t.string   "association_subnet_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "vpc_id"
  end

  create_table "aws_regions", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "aws_route_table_associations", force: true do |t|
    t.string   "route_table_id"
    t.string   "route_table_association_id"
    t.string   "subnet_id"
    t.boolean  "main"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "aws_route_table_propogates", force: true do |t|
    t.string   "route_table_id"
    t.string   "gateway_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "aws_route_table_routes", force: true do |t|
    t.string   "route_table_id"
    t.string   "destination_cidr_block"
    t.string   "gateway_id"
    t.string   "instance_id"
    t.string   "instance_owner_id"
    t.string   "network_interface_id"
    t.string   "vpc_peering_connection_id"
    t.string   "state"
    t.string   "origin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "aws_route_table_tags", force: true do |t|
    t.string   "route_table_id"
    t.string   "key"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "aws_route_tables", force: true do |t|
    t.integer  "aws_account_id"
    t.integer  "aws_region_id"
    t.string   "route_table_id"
    t.string   "vpc_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "aws_security_group_egresses", force: true do |t|
    t.string   "security_group_id"
    t.string   "egress_id"
    t.string   "ip_protocol"
    t.integer  "from_port"
    t.integer  "to_port"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "aws_security_group_ingresses", force: true do |t|
    t.string   "security_group_id"
    t.string   "ingress_id"
    t.string   "ip_protocol"
    t.integer  "from_port"
    t.integer  "to_port"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "aws_security_group_pairs", force: true do |t|
    t.string   "security_group_id"
    t.string   "permission_set_id"
    t.string   "user_id"
    t.string   "group_name"
    t.string   "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "aws_security_group_ranges", force: true do |t|
    t.string   "security_group_id"
    t.string   "permission_set_id"
    t.string   "cidr_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "aws_security_group_tags", force: true do |t|
    t.string   "security_group_id"
    t.string   "key"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "aws_security_groups", force: true do |t|
    t.string   "owner_id"
    t.text     "group_name"
    t.string   "group_id"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "aws_account_id"
    t.integer  "aws_region_id"
  end

  create_table "aws_subnets", force: true do |t|
    t.string   "subnet_id"
    t.string   "state"
    t.string   "vpc_id"
    t.string   "cidr_block"
    t.integer  "available_ip_address_count"
    t.string   "availability_zone"
    t.boolean  "default_for_az"
    t.boolean  "map_public_ip_on_launch"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "aws_vpc_tags", force: true do |t|
    t.integer  "aws_vpc_id"
    t.string   "name"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "aws_vpcs", force: true do |t|
    t.string   "vpc_id"
    t.string   "state"
    t.string   "cidr_block"
    t.string   "dhcp_options_id"
    t.string   "instance_default"
    t.boolean  "is_default"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "aws_account_id"
    t.integer  "aws_region_id"
  end

  create_table "checkpoint_fequencies", force: true do |t|
    t.string   "name"
    t.integer  "hours_apart"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "checkpoint_frequencies", force: true do |t|
    t.string   "name"
    t.integer  "hours_apart"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ebs_snapshot_tags", force: true do |t|
    t.string   "snapshot_id"
    t.string   "key"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ebs_snapshots", force: true do |t|
    t.string   "aws_account_id"
    t.integer  "aws_region_id"
    t.string   "snapshot_id"
    t.string   "volume_id"
    t.string   "state"
    t.datetime "start_time"
    t.string   "progress"
    t.string   "owner_id"
    t.text     "description"
    t.integer  "volume_size"
    t.boolean  "encrypted"
    t.boolean  "replicated"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "replicant_of"
  end

  create_table "ebs_volume_tags", force: true do |t|
    t.string   "volume_id"
    t.string   "key"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ebs_volumes", force: true do |t|
    t.string   "aws_account_id"
    t.string   "aws_region_id"
    t.string   "volume_id"
    t.integer  "size"
    t.string   "snapshot_id"
    t.string   "availability_zone"
    t.string   "state"
    t.datetime "create_time"
    t.string   "volume_type"
    t.integer  "iops"
    t.boolean  "encrypted"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "environments", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "aws_account_id"
    t.string   "primary_vpc_id"
    t.string   "dr_vpc_id"
    t.boolean  "dr_enabled"
    t.integer  "checkpoint_frequency_id"
    t.integer  "dr_lead_time"
    t.integer  "backup_retention"
    t.integer  "sysid_id"
  end

  create_table "host_states", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hosts", force: true do |t|
    t.string   "hostname"
    t.integer  "environment_id"
    t.integer  "aws_account_id"
    t.string   "sysid"
    t.integer  "chef_environment_id"
    t.integer  "host_state_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sysid_id"
    t.string   "instance_id"
    t.datetime "last_checkpoint"
  end

  create_table "indices", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "instance_block_device_mappings", force: true do |t|
    t.string   "instance_id"
    t.string   "device_name"
    t.string   "volume_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "instance_eni_mappings", force: true do |t|
    t.string   "instance_id"
    t.string   "network_interface_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "instance_eni_tags", force: true do |t|
    t.string   "network_interface_id"
    t.string   "key"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "instance_enis", force: true do |t|
    t.integer  "host_id"
    t.string   "instance_id"
    t.string   "network_interface_id"
    t.string   "subnet_id"
    t.string   "vpc_id"
    t.string   "owner_id"
    t.string   "status"
    t.string   "mac_address"
    t.boolean  "source_dest_check"
    t.string   "attachment_id"
    t.datetime "attach_date_time"
    t.string   "public_ip"
    t.string   "public_dns_name"
    t.string   "private_ip_address"
    t.string   "private_dns_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "instance_security_group_mappings", force: true do |t|
    t.string   "instance_id"
    t.string   "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "instance_tags", force: true do |t|
    t.string   "instance_id"
    t.string   "name"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "instances", force: true do |t|
    t.integer  "host_id"
    t.string   "instance_id"
    t.string   "owner_id"
    t.integer  "state_code"
    t.string   "state"
    t.string   "key_name"
    t.boolean  "monitoring"
    t.string   "instance_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "availability_zone"
    t.string   "group"
    t.string   "tenancy"
    t.datetime "launch_time"
    t.string   "subnet_id"
    t.string   "vpc_id"
    t.string   "private_ip_address"
    t.string   "public_ip_address"
    t.string   "architecture"
    t.string   "root_device_type"
    t.string   "root_device_name"
    t.string   "virtualization_type"
    t.string   "client_token"
    t.boolean  "source_dest_check"
    t.string   "hypervisor"
    t.boolean  "ebs_optimized"
  end

  create_table "sysids", force: true do |t|
    t.string   "name"
    t.string   "owner"
    t.string   "email_notification"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
