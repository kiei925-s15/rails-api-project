class ForecastsController < ApplicationController


  def location
    #render('forecasts/location')
    @address = params[:address]
  end

end


