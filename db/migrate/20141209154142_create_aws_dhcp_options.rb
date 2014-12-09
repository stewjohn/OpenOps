class CreateAwsDhcpOptions < ActiveRecord::Migration
  def change
    create_table :aws_dhcp_options do |t|
      t.integer :aws_account_id
      t.integer :aws_region_id
      t.string :dhcp_options_id

      t.timestamps
    end
  end
end
