class CreateAwsRouteTables < ActiveRecord::Migration
  def change
    create_table :aws_route_tables do |t|
      t.integer :aws_account_id
      t.integer :aws_region_id
      t.string :route_table_id
      t.string :vpc_id

      t.timestamps
    end
  end
end
