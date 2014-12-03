class AwsVpc < ActiveRecord::Base
  belongs_to :aws_region
  belongs_to :aws_account, primary_key: 'account_number'
  has_many :aws_subnets, primary_key: 'vpc_id', foreign_key: 'vpc_id'

  validates :aws_region, :aws_account, presence: true
  validates :vpc_id,:state, :cidr_block, :dhcp_options_id, :aws_account_id, :aws_region_id, presence: true


  def self.with_account
    self.includes(:aws_account)
  end

  def self.update_vpcs
    AwsAccount.all.each do |account|
      AwsRegion.all.each do |aws_region |
        creds = Aws::Credentials.new(account.access_key_id, account.secrete_access_key)
        ec2 = Aws::EC2::Client.new(region: aws_region.name, credentials: creds, http_proxy: "https://proxy:8080")
        ec2.describe_vpcs.vpcs.each do |vpc|
          saved_vpc = AwsVpc.where(vpc_id: vpc.vpc_id).first_or_initialize
          saved_vpc.aws_region_id = aws_region.id
          saved_vpc.aws_account_id = account.account_number
          saved_vpc.vpc_id = vpc.vpc_id
          saved_vpc.state = vpc.state
          saved_vpc.cidr_block = vpc.cidr_block
          saved_vpc.dhcp_options_id = vpc.dhcp_options_id
          saved_vpc.is_default = vpc.is_default
          saved_vpc.save
          puts saved_vpc.errors.messages
        end
      end
    end
  end

end
