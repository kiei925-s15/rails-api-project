class ForecastsController < ApplicationController
  def address
    @location = Location.find_by({ :forecasts => params["address" ]})
  end
end


