require 'open-uri'
require 'json'

class ForecastsController < ApplicationController
	def location
		#@forecast = Forecasts.params["address"]
		#url_safe_street_address = URI.encode(params["address"])
		@street_address = params["address"]
		url_safe_street_address = URI.encode(@street_address)
		url_of_data_we_want = "http://maps.googleapis.com/maps/api/geocode/json?address=#{url_safe_street_address}"
		raw_data = open(url_of_data_we_want).read
		parsed_data = JSON.parse(raw_data)
		@the_latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]
		@the_longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]

		street_address_2 = "#{@the_latitude},#{@the_longitude}"
		url_safe_street_address = URI.encode(street_address_2)

		url_of_data_we_want = "https://api.forecast.io/forecast/f3fd7a235149bf9d4eb20dead0b3a9eb/#{url_safe_street_address}"
		raw_data = open(url_of_data_we_want).read
		parsed_data = JSON.parse(raw_data)

		@the_temperature = parsed_data["currently"]["temperature"]
		@the_hour_outlook = parsed_data["minutely"]["summary"]
		@the_day_outlook = parsed_data["hourly"]["summary"]
		@the_week_outlook = parsed_data["daily"]["summary"]





	end
end
