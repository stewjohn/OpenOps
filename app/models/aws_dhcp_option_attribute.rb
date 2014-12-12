class AwsDhcpOptionAttribute < ActiveRecord::Base
belongs_to :aws_dhcp_option, primary_key: 'dhcp_options_id', foreign_key: 'dhcp_options_id'
end
