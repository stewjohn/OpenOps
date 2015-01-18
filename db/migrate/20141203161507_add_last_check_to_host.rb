class AddLastCheckToHost < ActiveRecord::Migration
  def change
    add_column :hosts, :last_checkpoint, :datetime
  end
end
