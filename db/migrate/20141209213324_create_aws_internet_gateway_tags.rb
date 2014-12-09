class CreateAwsInternetGatewayTags < ActiveRecord::Migration
  def change
    create_table :aws_internet_gateway_tags do |t|
      t.string :internet_gateway_id
      t.string :key
      t.string :value

      t.timestamps
    end
  end
end
