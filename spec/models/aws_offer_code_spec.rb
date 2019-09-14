require 'rails_helper'

RSpec.describe AwsOfferCode, type: :model do
	describe 'associations' do
		it { should belong_to(:aws_region) }
		it { should have_many(:offer_code_update_statuses) }
	end

	describe 'validations' do
		it { should validate_presence_of(:offer_code) }
		it { should validate_presence_of(:aws_region_id) }
	end
end

puts '----aws offer code model -----'

