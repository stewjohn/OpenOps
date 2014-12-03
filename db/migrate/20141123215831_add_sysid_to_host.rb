class AddSysidToHost < ActiveRecord::Migration
  def change
    add_column :hosts, :sysid_id, :integer
  end
end
