class CreateSysids < ActiveRecord::Migration
  def change
    create_table :sysids do |t|
      t.string :name
      t.string :owner
      t.string :email_notification

      t.timestamps
    end
  end
end
