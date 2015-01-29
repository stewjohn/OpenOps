class AddDrToHost < ActiveRecord::Migration
  def change
    add_column :hosts, :dr_instance_id, :string
  end
end
