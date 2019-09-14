require 'rails_helper'

describe 'Routes Spec', type: :routing do
	it "should route check  routes" do
		expect(get: '/service/:offercode/region/:region').to be_routable
	end
end

puts '----routes test passed'