class CreateOfferCodeUpdateStatuses < ActiveRecord::Migration[5.2]
	def change
		create_table :offer_code_update_statuses do |t|
			t.date :for_date
			t.references :aws_offer_code, foreign_key: true
			t.timestamps
		end
	end
end
