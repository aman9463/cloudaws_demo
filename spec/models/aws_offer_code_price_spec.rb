require 'rails_helper'

RSpec.describe AwsOfferCodePrice, type: :model do
  describe 'associations' do
    it { should belong_to(:currency) }
    it { should belong_to(:offer_code_update_status) }
  end

describe 'validations' do
	it { should validate_presence_of(:offer_code_update_status_id) }
end
end

puts '----aws offer code price model-----'

