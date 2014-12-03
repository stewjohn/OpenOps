class CreateInstanceTags < ActiveRecord::Migration
  def change
    create_table :instance_tags do |t|
      t.string :instance_id
      t.string :name
      t.string :value

      t.timestamps
    end
  end
end
