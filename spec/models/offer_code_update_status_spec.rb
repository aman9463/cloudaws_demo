require 'rails_helper'

RSpec.describe OfferCodeUpdateStatus, type: :model do
	describe 'associations' do
		it { should belong_to(:aws_offer_code) }
		it { should have_many(:aws_offer_code_prices) }
	end

	describe 'validations' do
		it { should validate_presence_of(:for_date) }
		it { should validate_presence_of(:aws_offer_code_id) }
	end
end

puts '----OfferCodeUpdateStatus model -----'

