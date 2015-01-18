class AwsRegion < ActiveRecord::Base
has_many :aws_account_attributes  
has_many :aws_elastic_ips
has_many :aws_internet_gateways
has_many :aws_key_pairs
has_many :aws_vpcs

end
