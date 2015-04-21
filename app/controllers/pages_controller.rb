class PagesController < ApplicationController
  def home
    @home = Home.find_by({ :home => params["the_home" ]})
  end
end
