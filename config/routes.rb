require 'resque/server'
require 'resque/scheduler'
require 'resque/scheduler/server'
Rails.application.routes.draw do

get "service/:offercode/region/:region" => 'home#view_pricing', as: :view_pricing
mount Resque::Server.new, :at => "/resque"
end
