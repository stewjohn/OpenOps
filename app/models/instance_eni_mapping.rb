class InstanceEniMapping < ActiveRecord::Base
  belongs_to :instance_eni, primary_key: 'network_interface_id', foreign_key: 'network_interface_id'


end
