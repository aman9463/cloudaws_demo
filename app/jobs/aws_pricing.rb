require 'resque-scheduler'
require 'resque/server'
module AwsPricing
	@queue = :aws_pricing_queue

		def self.perform
			Rake::Task['aws_data'].invoke
		end
	end