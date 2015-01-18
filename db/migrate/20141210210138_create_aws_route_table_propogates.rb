class CreateAwsRouteTablePropogates < ActiveRecord::Migration
  def change
    create_table :aws_route_table_propogates do |t|
      t.string :route_table_id
      t.string :gateway_id

      t.timestamps
    end
  end
end
