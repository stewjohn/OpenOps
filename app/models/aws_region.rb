class AwsRegion < ActiveRecord::Base
has_many :aws_account_attributes  
has_many :aws_elastic_ips


end
