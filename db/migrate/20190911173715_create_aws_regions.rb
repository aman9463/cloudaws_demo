class CreateAwsRegions < ActiveRecord::Migration[5.2]
  def change
    create_table :aws_regions do |t|
    	t.string :region_name, index: true
      t.timestamps
    end
  end
end
