class CreateAwsRouteTableAssociations < ActiveRecord::Migration
  def change
    create_table :aws_route_table_associations do |t|
      t.string :route_table_id
      t.string :route_table_association_id
      t.string :route_table_id
      t.string :subnet_id
      t.boolean :main

      t.timestamps
    end
  end
end
