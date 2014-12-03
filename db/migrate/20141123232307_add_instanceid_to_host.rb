class AddInstanceidToHost < ActiveRecord::Migration
  def change
    add_column :hosts, :instance_id, :string
  end
end
