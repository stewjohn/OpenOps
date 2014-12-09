class CreateAwsDhcpOptionAttributes < ActiveRecord::Migration
  def change
    create_table :aws_dhcp_option_attributes do |t|
      t.string :dhcp_options_id
      t.string :key
      t.string :value

      t.timestamps
    end
  end
end
