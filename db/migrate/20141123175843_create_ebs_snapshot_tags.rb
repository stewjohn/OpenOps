class CreateEbsSnapshotTags < ActiveRecord::Migration
  def change
    create_table :ebs_snapshot_tags do |t|
      t.string :snapshot_id
      t.string :key
      t.string :value

      t.timestamps
    end
  end
end
