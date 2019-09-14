require 'rails_helper'

RSpec.describe MasterCurrency, type: :model do
	describe 'associations' do
		it { should have_many(:aws_offer_code_prices) }
	end

	describe 'validations' do
		it { should validate_presence_of(:currency_name) }
		it { should validate_presence_of(:default_currency_name) }
	end
end

puts '----MasterCurrency model-----'

