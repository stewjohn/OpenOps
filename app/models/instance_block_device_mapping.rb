class InstanceBlockDeviceMapping < ActiveRecord::Base
  belongs_to :instance, primary_key: 'instance_id', foreign_key: 'instance_id'
  belongs_to :ebs_volume, primary_key: 'volume_id', foreign_key: 'volume_id'
  has_many :ebs_snapshots, through: :ebs_volume

  def self.join_all
    self.includes(:ebs_volume,:instance)
  end

end
