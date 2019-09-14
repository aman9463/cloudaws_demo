require 'rails_helper'

RSpec.describe AwsRegion, type: :model do
	describe 'associations' do
		it { should have_many(:aws_offer_codes) }
	end

	describe 'validations' do
		it { should validate_presence_of(:region_name) }
	end
end

puts '----aws Region model-----'

