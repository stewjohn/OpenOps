class AddPlacementToInstance < ActiveRecord::Migration
  def change
    add_column :instances, :group, :string
    add_column :instances, :tenancy, :string
  end
end
