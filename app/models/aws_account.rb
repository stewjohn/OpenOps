class AwsAccount < ActiveRecord::Base
  has_many :aws_vpcs, primary_key: 'account_number'
  has_many :aws_regions, through: :aws_vpcs
  has_many :instances, primary_key: 'account_number', foreign_key: 'owner_id'
  has_many :aws_account_attributes 
  has_many :aws_elastic_ips
  has_many :aws_internet_gateways
  has_many :aws_key_pairs
  has_many :aws_security_groups

  validates :account_name, :access_key_id, :secrete_access_key, :account_number, presence: true

  def self.with_vpc
    self.includes(:aws_vpcs,:aws_regions,:aws_security_groups)
  end
  
   def self.only_vpc
    self.includes(:aws_vpcs,:aws_regions)
  end

end
