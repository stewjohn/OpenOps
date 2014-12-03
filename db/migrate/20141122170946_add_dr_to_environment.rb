class AddDrToEnvironment < ActiveRecord::Migration
  def change
    add_column :environments, :dr_enabled, :boolean
    add_column :environments, :checkpoint_frequency_id, :integer
    add_column :environments, :dr_lead_time, :integer
  end
end
