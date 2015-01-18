class CreateAwsVpcTags < ActiveRecord::Migration
  def change
    create_table :aws_vpc_tags do |t|
      t.integer :aws_vpc_id
      t.string :name
      t.string :value

      t.timestamps
    end
  end
end
