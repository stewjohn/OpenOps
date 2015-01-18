class CreateAwsRouteTableTags < ActiveRecord::Migration
  def change
    create_table :aws_route_table_tags do |t|
      t.string :route_table_id
      t.string :key
      t.string :value

      t.timestamps
    end
  end
end
