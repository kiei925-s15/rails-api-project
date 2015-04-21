require 'open-url'
require 'json'
# require 'openssl'
# OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

class ForecastsController < ApplicationController

    def location
        @street_address = {:location => params["address"]}.to_s
        url_safe_street_address = URI.encode(@street_address)

        # Code to get the latitude and longitude using google maps API
        url_of_data_we_want = "http://maps.googleapis.com/maps/api/geocode/json?address="+ url_safe_street_address
        raw_data = open(url_of_data_we_want).read
        parsed_data = JSON.parse(raw_data)

        the_latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]
        the_longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]

        #Code to get the weather using dark sky
        url_of_data_we_want2 = "https://api.forecast.io/forecast/2fe02e8e6bfe071290046eeec157db50/"+ the_latitude.to_s + "," + the_longitude.to_s
        raw_data2 = open(url_of_data_we_want2).read
        parsed_data2 = JSON.parse(raw_data2)

        @the_temperature = parsed_data2["currently"]["temperature"]
        @the_hour_outlook = parsed_data2["hourly"]["summary"]
        @the_day_outlook = parsed_data2["daily"]["summary"]

        render 'location'
    end
end


  #def sign
   # @zodiac = Zodiac.find_by({:sign => params["the_sign"] })
 # end

 # street_address = gets.chomp
 # url_safe_street_address = URI.encode(street_address)



