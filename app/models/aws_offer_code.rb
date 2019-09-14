class AwsOfferCode < ApplicationRecord
	# assoctaions
	belongs_to :aws_region
	has_many :offer_code_update_statuses

		# validations
	validates :offer_code, presence: true
	validates :aws_region_id, presence: true
end
