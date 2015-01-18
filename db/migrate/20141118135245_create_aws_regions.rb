class CreateAwsRegions < ActiveRecord::Migration
  def change
    create_table :aws_regions do |t|
      t.string :name

      t.timestamps
    end
  end
end
