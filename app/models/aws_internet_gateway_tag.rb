class AwsInternetGatewayTag < ActiveRecord::Base
belongs_to :aws_internet_gateway, primary_key: 'internet_gateway_id', foreign_key: 'internet_gateway_id'
end
