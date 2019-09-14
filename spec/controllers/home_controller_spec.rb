require 'rails_helper'

RSpec.describe HomeController, type: :controller do

	describe "GET #view_pricing" do
		it "should get lists of pricing" do
			get :view_pricing, {params: {region: 'us-east-1', offercode: 'AmazonCloudFront'}}
			expect(response).to have_http_status(204)
		end
	end
end
