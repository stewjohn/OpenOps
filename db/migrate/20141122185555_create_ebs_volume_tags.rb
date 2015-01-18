class CreateEbsVolumeTags < ActiveRecord::Migration
  def change
    create_table :ebs_volume_tags do |t|
      t.string :volume_id
      t.string :key
      t.string :value

      t.timestamps
    end
  end
end
