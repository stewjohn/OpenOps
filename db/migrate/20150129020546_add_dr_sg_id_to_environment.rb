class AddDrSgIdToEnvironment < ActiveRecord::Migration
  def change
    add_column :environments, :dr_security_group_id, :string
  end
end
