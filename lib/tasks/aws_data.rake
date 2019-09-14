# rake aws_data['us-east-1','AmazonS3']
# rake task to add prices
task :aws_data, [:region, :offercode] => :environment do |task, args|
	Rails.logger = Logger.new(STDOUT)
    Rails.logger.level = Logger::DEBUG
	if args[:region].present? && args[:offercode].present?
		aws_final_url = SetAwsUrl.new(args[:region], args[:offercode]).aws_url
	else
		aws_final_url = AWS_URL
	end
	init_api(aws_final_url)
end
# end

# uses for get the response from urk
def init_api(aws_final_url)
	begin
		conn = Faraday.new(aws_final_url, :ssl => {:verify => false})
		response = conn.get do |aws|
			aws.headers['Content-Type'] = 'application/json' 
		end
		if response.status == 200
			regions(aws_final_url)
			offercode(aws_final_url)
			@json_res = JSON.parse(response.body)
			save_pricing
		else
			raise "Could not get the response"
		end
	rescue Exception => e
		puts e
	end
end


# used for saving pricing to the database
def save_pricing
	if !(Time.current.beginning_of_day..Time.current.end_of_day).include?(@aws_offer_code.offer_code_update_statuses.last.try(:for_date))
		offer_code_update_statuses = @aws_offer_code.offer_code_update_statuses.create(for_date: Time.current)
		@json_res["terms"]["OnDemand"].each do |k,v|
			price_json = v.to_a
			get_final_json = price_json[0][1]
			price_dimension_json = get_final_json["priceDimensions"].to_a[0][1]
			currency_json = price_dimension_json["pricePerUnit"].to_a[0]
			currency_id = MasterCurrency.get_id(currency_json[0])
			price_per_unit = currency_json[1]
			if get_final_json.present?
				aws_price_params = {
					sku: get_final_json["sku"],
					effective_date: get_final_json["effectiveDate"],
					currency_id: currency_id,
					description: price_dimension_json["description"],
					begin_range: price_dimension_json["beginRange"],
					end_range: price_dimension_json["endRange"],
					unit: price_dimension_json["unit"],
					price_per_unit: price_per_unit
				}
				puts "#{get_final_json["sku"]} saved"
				offer_code_update_statuses.aws_offer_code_prices.create(aws_price_params)
			end
		end
	else
		puts "Price can be update once in a day"
	end
end

# used for get region from the url
def regions(aws_final_url)
	region_name = aws_final_url[/pricing.(.*?).amazon/, 1]
	
	@aws_region = AwsRegion.find_or_create_by(region_name: region_name)
end

# used for get offercode from the url
def offercode(aws_final_url)
		offer_code = aws_final_url[/\/aws\/(.*?)\/current/, 1]
		# offer_code = 'AmazonCloudFront'
		@aws_offer_code = AwsOfferCode.find_or_create_by(aws_region_id: @aws_region.id, offer_code: offer_code)
	end

# class sed for set the final url
class SetAwsUrl
	attr_accessor :aws_url
	def initialize(region, offercode)
		@aws_url = "https://pricing.#{region}.amazonaws.com/offers/v1.0/aws/#{offercode}/current/index.json"
	end
end