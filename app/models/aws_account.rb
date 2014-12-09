class AwsAccount < ActiveRecord::Base
  has_many :aws_vpcs, primary_key: 'account_number'
  has_many :aws_regions, through: :aws_vpcs
  has_many :instances, primary_key: 'account_number', foreign_key: 'owner_id'
  has_many :aws_account_attributes 
  has_many :aws_elastic_ips
  has_many :aws_internet_gateways
  
  def self.with_vpc
    self.includes(:aws_vpcs,:aws_regions)
  end

end
