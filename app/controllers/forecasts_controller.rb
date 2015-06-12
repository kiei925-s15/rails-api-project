require 'open-uri'
require 'json'

class ForecastsController < ApplicationController

  def location

 # - retrieve the user input (whatever they typed after the slash)

    url_safe_street_address = params["address"]

 # - exchange it for a lat/lng pair from the Geocoding API

    url_of_data_we_want = "http://maps.googleapis.com/maps/api/geocode/json?address=" + url_safe_street_address
    raw_data = open(url_of_data_we_want).read
    parsed_data = JSON.parse(raw_data)

    the_latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]
    the_longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]


 # - exchange the lat/lng pair for weather info from the Forecast API

    url_of_data_we_want_2 = "https://api.forecast.io/forecast/78a95bd0ed5214510f6689de6599d061/" + the_latitude.to_s + ',' + the_longitude.to_s
    raw_data_2 = open(url_of_data_we_want_2).read
    parsed_data_2 = JSON.parse(raw_data_2)


 # - place any values that you want to show the user in instance variables

    @the_temperature = parsed_data_2["currently"]["temperature"]
    @the_hour_outlook = parsed_data_2["hourly"]["summary"]
    @the_day_outlook = parsed_data_2["daily"]["summary"]
    @street_address = parsed_data["results"][0]["formatted_address"]
  end
end
