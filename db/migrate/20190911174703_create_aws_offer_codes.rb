class CreateAwsOfferCodes < ActiveRecord::Migration[5.2]
	def change
		create_table :aws_offer_codes do |t|
			t.string :offer_code, index: true
			t.references :aws_region, foreign_key: true
			t.timestamps
		end
	end
end
