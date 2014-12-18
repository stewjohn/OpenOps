class AwsSecurityGroupRange < ActiveRecord::Base
belongs_to :aws_security_group, primary_key: 'security_group_id', foreign_key: 'group_id'
belongs_to :aws_security_group_egress, primary_key: 'permission_set_id', foreign_key: 'egress_id'
belongs_to :aws_security_group_ingress, primary_key: 'permission_set_id', foreign_key: 'ingress_id'

end
