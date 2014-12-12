class AddSysidIdToEnvironment < ActiveRecord::Migration
  def change
    add_column :environments, :sysid_id, :integer
  end
end
