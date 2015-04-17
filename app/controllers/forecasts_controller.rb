require 'open-uri'
require 'json'

class ForecastsController < ApplicationController

  def location
    @street_address = params[:address]

    geocoding_api_url = "https://maps.googleapis.com/maps/api/geocode/json?address=#{@street_address}"

    geocoding_raw_results = open(geocoding_api_url).read

    geocoding_parsed_results = JSON.parse(geocoding_raw_results)

    latitude = geocoding_parsed_results["results"][0]["geometry"]["location"]["lat"]
    longitude = geocoding_parsed_results["results"][0]["geometry"]["location"]["lng"]

    forecast_api_url = "https://api.forecast.io/forecast/589d3a4a6cddd405719060be6d7b4d32/#{latitude},#{longitude}"

    forecast_raw_results = open(forecast_api_url).read

    forecast_parsed_results = JSON.parse(forecast_raw_results)

    @temperature = forecast_parsed_results["currently"]["temperature"]
    @minutely_summary = forecast_parsed_results["minutely"]["summary"]
    @hourly_summary = forecast_parsed_results["hourly"]["summary"]
    @daily_summary = forecast_parsed_results["daily"]["summary"]
  end

end
