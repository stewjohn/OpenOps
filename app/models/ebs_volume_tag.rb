class EbsVolumeTag < ActiveRecord::Base
belongs_to :ebs_volume, primary_key: 'volume_id', foreign_key: 'volume_id' 

end
