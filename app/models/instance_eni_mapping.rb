class InstanceEniMapping < ActiveRecord::Base
  belongs_to :instance_eni, primary_key: 'network_interface_id', foreign_key: 'network_interface_id'
  has_one :instance, primary_key: 'instance_id', foreign_key: 'instance_id'

end
