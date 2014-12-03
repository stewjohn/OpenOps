class AwsAccount < ActiveRecord::Base
  has_many :aws_vpcs, primary_key: 'account_number'
  has_many :aws_regions, through: :aws_vpcs
  has_many :instances, primary_key: 'account_number', foreign_key: 'owner_id'
  def self.with_vpc
    self.includes(:aws_vpcs,:aws_regions)
  end

end
