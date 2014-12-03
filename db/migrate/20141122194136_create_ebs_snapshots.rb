class CreateEbsSnapshots < ActiveRecord::Migration
  def change
    create_table :ebs_snapshots do |t|
      t.string :aws_account_id
      t.integer :aws_region_id
      t.string :snapshot_id
      t.string :volume_id
      t.string :state
      t.datetime :start_time
      t.string :progress
      t.string :owner_id
      t.text :description
      t.integer :volume_size
      t.boolean :encrypted
      t.boolean :replicated

      t.timestamps
    end
  end
end
