    class ForecastsController<ApplicationController
    require 'open-uri'
    require 'json'

 def location
    # params= {"address"=>"Humboldt"}
    @address= params["address"]

the_latitude=parsed_data["results"][0]["geometry"]["location"]["lat"]
the_longitude=parsed_data["results"][0]["geometry"]["location"]["lng"]

  end
end
