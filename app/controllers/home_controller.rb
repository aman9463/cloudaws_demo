class HomeController < ApplicationController
	before_action :find_region
	def view_pricing
		begin
			offer_code = @region.aws_offer_codes.find_by(offer_code: params[:offercode])
			date = params[:date].present? ? params[:date].to_date : ''
			price_arr = offer_code.offer_code_update_statuses.map{|stat|
				result  = stat.as_json(only: [])
				result["updated_on"] = stat.for_date
				offer_codes = get_offer_codes(stat)
				offer_price_result = offer_codes.map{ |offer_price|
					offer_price_json = offer_price.as_json(only: [:id])
					offer_price_json['description'] = offer_price.description
					offer_price_json['beginRange'] = offer_price.begin_range
					offer_price_json['endRange']= offer_price.end_range
					offer_price_json['unit']= offer_price.unit
					offer_price_json['currency'] = offer_price.currency.currency_name
					offer_price_json['pricePerUnit']= offer_price.price_per_unit
					offer_price_json['effectiveDate']= offer_price.effective_date
					offer_price_json
				}
				result["price"] = {}
				result["price"] = offer_price_result
				result
			}
			render json: price_arr
		rescue Exception => e
			render json: e.message
		end
	end


	def get_offer_codes(stat)
		if params[:date].present?
			date = params[:date].to_date
			stat.aws_offer_code_prices.includes(:currency).where('effective_date LIKE ?', "%#{date}%")
		else
			stat.aws_offer_code_prices.includes(:currency)
		end


	end
	private
	def find_region
		@region = AwsRegion.find_by(region_name: params[:region])
	end


end
