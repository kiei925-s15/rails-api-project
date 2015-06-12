require 'open-uri'
require 'json'


class ForecastsController < ApplicationController
  def location
  	@address = params["address"]
  	url_safe_address = URI.encode(params["address"])
  	geocode_url_data = "http://maps.googleapis.com/maps/api/geocode/json?address=" + url_safe_address.to_s
  	raw_geocode = open(geocode_url_data).read
  	parsed_geocode = JSON.parse(raw_geocode)
  	the_latitude = parsed_geocode["results"][0]["geometry"]["location"]["lat"]
	the_longitude = parsed_geocode["results"][0]["geometry"]["location"]["lng"]
	
	url_weather_data = "https://api.forecast.io/forecast/5c48999e1c9b93f9fd0134d755bf0271/" + the_latitude.to_s + "," + the_longitude.to_s
	raw_weather_data = open(url_weather_data).read
	parsed_weather_data = JSON.parse(raw_weather_data)

	@the_hour_outlook = parsed_weather_data["hourly"]["data"][1]["summary"]
	@the_day_outlook = parsed_weather_data["daily"]["data"][1]["summary"]
	@the_temperature = parsed_weather_data["currently"]["temperature"]
	@the_week_outlook = parsed_weather_data["daily"]["summary"]
  end

  def home
  end
end
