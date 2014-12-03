class AddVpcToEnvironment < ActiveRecord::Migration
  def change
    add_column :environments, :primary_vpc_id, :string
    add_column :environments, :dr_vpc_id, :string
  end
end
