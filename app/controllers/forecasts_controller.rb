class ForecastsController < ApplicationController


  def location
    #render('forecasts/location')
    @address = params[:address]

    @name = "Paul"

    @temperature

  end

end


