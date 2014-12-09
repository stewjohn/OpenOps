#!/usr/bin/env ruby
ENV['RAILS_ENV'] ||= 'development'
require File.expand_path('../../config/environment', __FILE__)

AwsAccountAttribute.update_attr
AwsElasticIp.update_eip
AwsAz.update_az
AwsVpc.update_vpcs
AwsSubnet.update_subnets
Instance.update_instances
InstanceEni.update_eni
EbsVolume.update_volumes
EbsSnapshot.update_snapshots

puts "sync finished"
