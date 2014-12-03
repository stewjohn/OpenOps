class CreateEbsVolumes < ActiveRecord::Migration
  def change
    create_table :ebs_volumes do |t|
      t.string :aws_account_id
      t.string :aws_region_id
      t.string :volume_id
      t.integer :size
      t.string :snapshot_id
      t.string :availability_zone
      t.string :state
      t.datetime :create_time
      t.string :volume_type
      t.integer :iops
      t.boolean :encrypted

      t.timestamps
    end
  end
end
