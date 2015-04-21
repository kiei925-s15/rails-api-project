require 'open-uri'
require 'json'



# If you experience an error relating to SSL,
#   uncomment the following two lines:
# #
# require 'openssl'
# OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

class ForecastsController < ApplicationController

  def location

@street_address = {:location => params["address"]}
url_safe_street_address = URI.encode(street_address)

url_of_data_we_want = "http://maps.googleapis.com/maps/api/geocode/json?address="+ url_safe_street_address
raw_data = open(url_of_data_we_want).read
parsed_data = JSON.parse(raw_data)

the_latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]
the_longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]

# Ultimately, we want the following line to work when uncommented:

url_of_forecast = "https://api.forecast.io/forecast/8df5e9a5877dc0f314a7795f78b8f6a3/"+ the_latitude.to_s + "," + the_longitude.to_s
raw_dataf = open(url_of_forecast).read
parsed_dataf = JSON.parse(raw_dataf)

the_temperature = parsed_dataf["currently"]["temperature"]
the_hour_outlook = parsed_dataf["minutely"]["summary"]
the_day_outlook = parsed_dataf["hourly"]["summary"]
the_week_outlook = parsed_dataf["daily"]["summary"]

render 'location'

 end
end
