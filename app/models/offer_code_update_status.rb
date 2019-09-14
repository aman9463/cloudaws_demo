class OfferCodeUpdateStatus < ApplicationRecord
	# associations
	belongs_to :aws_offer_code
	has_many :aws_offer_code_prices

		# validations
	validates :for_date, presence: true
	validates :aws_offer_code_id, presence: true
end
