class AddReplicationToEbsSnapshot < ActiveRecord::Migration
  def change
    add_column :ebs_snapshots, :replicant_of, :string
  end
end
