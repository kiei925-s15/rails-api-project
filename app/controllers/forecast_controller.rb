require 'open-uri'
require 'json'



require 'openssl'
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

class ForecastController < ApplicationController
  def home

puts "Let's get the weather forecast for your address."

puts "What is the address you would like to know the weather for?"
street_address = gets.chomp
url_safe_street_address = URI.encode(street_address)

# Your code goes below. Hints:
url_of_data_we_want = 'http://maps.googleapis.com/maps/api/geocode/json?address=' + url_safe_street_address
raw_data = open(url_of_data_we_want).read
parsed_data = JSON.parse(raw_data)

# Let's store the latitude in a variable called 'the_latitude',
#   and the longitude in a variable called 'the_longitude'.

the_latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]
the_longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]


url_of_data_we_want = 'https://api.forecast.io/forecast/ca8abc9e3420cd2d4bd4e8015cfad928/'+the_latitude.to_s + ',' + the_longitude.to_s
raw_data = open(url_of_data_we_want).read
parsed_data = JSON.parse(raw_data)

the_temperature = parsed_data["currently"]["temperature"]
the_hour_outlook = parsed_data["minutely"]["summary"]
the_day_outlook = parsed_data["daily"]["data"][0]["summary"]
the_week_outlook = parsed.data["daily"]["summary"]
# # Ultimately, we want the following line to work when uncommented:

puts "The current temperature at #{url_safe_street_address}is #{the_temperature} degrees."
puts "The outlook for the next hour is: #{the_hour_outlook}"
puts "The outlook for the next day is: #{the_day_outlook}"
puts "The outlook for the next week is: #{the_week_outlook}"



  end
end
