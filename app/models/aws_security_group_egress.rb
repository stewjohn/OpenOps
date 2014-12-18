class AwsSecurityGroupEgress < ActiveRecord::Base
belongs_to :aws_security_group, primary_key: 'security_group_id', foreign_key: 'group_id'
has_many :aws_security_group_ranges, foreign_key: 'permission_set_id', primary_key: 'egress_id'
has_many :aws_security_group_pairs, foreign_key: 'permission_set_id', primary_key: 'egress_id'

end
