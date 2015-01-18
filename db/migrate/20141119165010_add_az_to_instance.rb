class AddAzToInstance < ActiveRecord::Migration
  def change
    add_column :instances, :availability_zone, :string
  end
end
