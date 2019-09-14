class CreateMasterCurrencies < ActiveRecord::Migration[5.2]
  def change
    create_table :master_currencies do |t|
    	t.string :currency_name
    	t.string :default_currency_name, index: true
      t.timestamps
    end
  end
end
