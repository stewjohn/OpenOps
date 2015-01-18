class CreateHostStates < ActiveRecord::Migration
  def change
    create_table :host_states do |t|
      t.string :name

      t.timestamps
    end
  end
end
