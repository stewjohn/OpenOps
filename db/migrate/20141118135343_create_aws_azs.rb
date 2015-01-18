class CreateAwsAzs < ActiveRecord::Migration
  def change
    create_table :aws_azs do |t|
      t.integer :aws_region_id
      t.string :name

      t.timestamps
    end
  end
end
