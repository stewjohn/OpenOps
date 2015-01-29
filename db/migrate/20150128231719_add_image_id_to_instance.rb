class AddImageIdToInstance < ActiveRecord::Migration
  def change
    add_column :instances, :image_id, :string
  end
end
