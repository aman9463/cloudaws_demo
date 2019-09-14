class CreateAwsOfferCodePrices < ActiveRecord::Migration[5.2]
  def change
    create_table :aws_offer_code_prices do |t|
    	t.string :sku
			t.references :offer_code_update_status, foreign_key: true, null: false
			t.references :currency, foreign_key: {to_table: :master_currencies}, index: true, null: false
			t.text :description
			t.string :begin_range
			t.string :end_range
			t.string :unit
			t.string :price_per_unit
			t.datetime :effective_date
      t.timestamps
    end
  end
end
