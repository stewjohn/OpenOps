class CreateAwsRouteTableRoutes < ActiveRecord::Migration
  def change
    create_table :aws_route_table_routes do |t|
      t.string :route_table_id
      t.string :destination_cidr_block
      t.string :gateway_id
      t.string :instance_id
      t.string :instance_owner_id
      t.string :network_interface_id
      t.string :vpc_peering_connection_id
      t.string :state
      t.string :origin

      t.timestamps
    end
  end
end
