class AwsVpcTag < ActiveRecord::Base
belongs_to :aws_vpc, primary_key: 'aws_vpc_id', foreign_key: 'vpc_id'
end
