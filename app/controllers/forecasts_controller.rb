require 'open-uri'
require 'json'
require 'uri'

class ForecastsController < ApplicationController

  def location

    # getting address
    @url_safe_street_address = params["address"]
    url_of_data_we_want = "https://maps.googleapis.com/maps/api/geocode/json?address=#{@url_safe_street_address}"

    # getting coords
    raw_data = open(url_of_data_we_want).read
    parsed_data = JSON.parse(raw_data)

    # parsing out coords
    the_latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]
    the_longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]

    #getting forecast
    url= "https://api.forecast.io/forecast/9c0529592fb8f0336f2de5262097c155/#{the_latitude},#{the_longitude}"

    raw_data = open(url).read
    parsed_data = JSON.parse(raw_data)

    #parsing out forecast
    @the_temperature = parsed_data["currently"]["temperature"]
    @the_hour_outlook = parsed_data["minutely"]["summary"]
    @the_day_outlook = parsed_data["hourly"]["summary"]
    @the_week_outlook = parsed_data["daily"]["summary"]

    @addy = URI.decode( params["address"])



    render 'location'

  end


end
