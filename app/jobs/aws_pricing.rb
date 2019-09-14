require 'resque-scheduler'
module AwsPricing
	@queue = :aws_pricing_queue

		def self.perform
			puts "asd"
		end
	end