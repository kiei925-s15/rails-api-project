require 'open-uri'
require 'json'
require 'openssl'
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

class ForecastsController < ApplicationController

  def location
    street_address = params["address"]
    url_safe_street_address = URI.encode(street_address)

    url_of_data_we_want = 'http://maps.googleapis.com/maps/api/geocode/json?address=' + url_safe_street_address
    raw_data = open(url_of_data_we_want).read
    parsed_data = JSON.parse(raw_data)

    the_latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]
    the_longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]

    url_of_data_we_want = 'https://api.forecast.io/forecast/ca8abc9e3420cd2d4bd4e8015cfad928/'+the_latitude.to_s + ',' + the_longitude.to_s
    raw_data = open(url_of_data_we_want).read
    parsed_data = JSON.parse(raw_data)

    @the_temperature = parsed_data["currently"]["temperature"]
    @the_hour_outlook = parsed_data["minutely"]["summary"]
    @the_day_outlook = parsed_data["daily"]["data"][0]["summary"]
    @the_week_outlook = parsed_data["daily"]["summary"]
    @clean_address = street_address.gsub("+", " ")
   render 'location'
  end
end
