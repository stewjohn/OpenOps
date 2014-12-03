class AwsSubnet < ActiveRecord::Base
  belongs_to :aws_vpc, primary_key: 'vpc_id', foreign_key: 'vpc_id'

  validates :subnet_id, :state, :vpc_id, :cidr_block, :available_ip_address_count, :availability_zone, presence: true


  def self.update_subnets
    AwsAccount.all.each do |account|
      AwsRegion.all.each do |aws_region |
        creds = Aws::Credentials.new(account.access_key_id, account.secrete_access_key)
        ec2 = Aws::EC2::Client.new(region: aws_region.name, credentials: creds, http_proxy: PROXY)
        ec2.describe_subnets.subnets.each do |subnet|
          saved_subnet = AwsSubnet.where(subnet_id: subnet.subnet_id).first_or_initialize
          saved_subnet.state = subnet.state
          saved_subnet.vpc_id = subnet.vpc_id
          saved_subnet.cidr_block = subnet.cidr_block
          saved_subnet.available_ip_address_count = subnet.available_ip_address_count
          saved_subnet.availability_zone = subnet.availability_zone
          saved_subnet.default_for_az = subnet.default_for_az
          saved_subnet.map_public_ip_on_launch = subnet.map_public_ip_on_launch
          saved_subnet.save
 	  puts saved_subnet.errors.messages
      end
      end
    end
  end
end
