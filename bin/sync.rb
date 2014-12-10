#!/usr/bin/env ruby
ENV['RAILS_ENV'] ||= 'development'
require File.expand_path('../../config/environment', __FILE__)

AwsAccountAttribute.update_attr
AwsElasticIp.update_eip
AwsAz.update_az
AwsVpc.update_vpcs
AwsInternetGateway.update_gw
AwsNetworkAcl.update_acl
AwsDhcpOption.update_options
AwsSubnet.update_subnets
AwsKeypair.update_keys
Instance.update_instances
InstanceEni.update_eni
EbsVolume.update_volumes
EbsSnapshot.update_snapshots

puts "sync finished"
