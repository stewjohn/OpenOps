class AddInfoToAwsAz < ActiveRecord::Migration
  def change
    add_column :aws_azs, :state, :string
  end
end
