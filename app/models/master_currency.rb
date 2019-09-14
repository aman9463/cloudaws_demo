class MasterCurrency < ApplicationRecord

	# associations
	has_many :aws_offer_code_prices, foreign_key: 'currency_id'

	# validations
	validates :currency_name, presence: true
	validates :default_currency_name, presence: true



	def self.get_id(currency)
		currency = self.find_or_create_by(default_currency_name: currency.downcase, currency_name: currency)
		return currency.id
	end
end
