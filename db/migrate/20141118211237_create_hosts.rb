class CreateHosts < ActiveRecord::Migration
  def change
    create_table :hosts do |t|
      t.string :hostname
      t.integer :environment_id
      t.integer :aws_account_id
      t.string :sysid
      t.integer :chef_environment_id
      t.integer :host_state_id

      t.timestamps
    end
  end
end
