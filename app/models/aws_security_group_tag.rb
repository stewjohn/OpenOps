class AwsSecurityGroupTag < ActiveRecord::Base
belongs_to :aws_security_group, primary_key: 'security_group_id', foreign_key: 'group_id'


end
