class InstanceSecurityGroupMapping < ActiveRecord::Base
  belongs_to :instance, primary_key: 'instance_id', foreign_key: 'instance_id'
  belongs_to :aws_security_group, primary_key: 'group_id', foreign_key: 'group_id'


end
