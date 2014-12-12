class AwsNetworkAclEntry < ActiveRecord::Base
belongs_to :aws_network_acl, primary_key: 'network_acl_id', foreign_key: 'network_acl_id'
end
