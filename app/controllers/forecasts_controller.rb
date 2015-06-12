class ForecastsController < ApplicationController
  require 'open-uri'
  require 'json'
  def location
    # params = {"address"=>"whatever address gets entered"}
    @street_address = params["address"]
    url_safe_street_address = URI.encode(@street_address)
    url_of_data_we_want1 = "http://maps.googleapis.com/maps/api/geocode/json?address="+params["address"]+"&sensor=false"
    raw_data1 = open(url_of_data_we_want1).read

    parsed_data1 = JSON.parse(raw_data1)
    geo_location = parsed_data1["results"][0]["geometry"]["location"]
    @the_latitude = geo_location["lat"]
    @the_longitude = geo_location["lng"]

    url_of_data_we_want2 = "https://api.forecast.io/forecast/c08001da7d19096c0879a5ba1d349e53/"+@the_latitude.to_s+","+@the_longitude.to_s
    raw_data2 = open(url_of_data_we_want2).read
    parsed_data2 = JSON.parse(raw_data2)
    @the_temperature = parsed_data2["currently"]["temperature"]
    @the_hour_outlook = parsed_data2["hourly"]["data"][1]["summary"]
    @the_day_outlook = parsed_data2["daily"]["data"][1]["summary"]
    @the_week_outlook = parsed_data2["daily"]["summary"]
  end

end
