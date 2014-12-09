class CreateAwsInternetGateways < ActiveRecord::Migration
  def change
    create_table :aws_internet_gateways do |t|
      t.integer :aws_account_id
      t.integer :aws_region_id
      t.string :internet_gateway_id
      t.string :attachment_vpc_id
      t.string :attachment_state

      t.timestamps
    end
  end
end
