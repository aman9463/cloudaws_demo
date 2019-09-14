class AwsRegion < ApplicationRecord
	# association
	has_many :aws_offer_codes

	# validations
	validates :region_name, presence: true
end
