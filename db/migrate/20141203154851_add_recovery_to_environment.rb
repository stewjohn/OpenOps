class AddRecoveryToEnvironment < ActiveRecord::Migration
  def change
    add_column :environments, :backup_retention, :integer
  end
end
