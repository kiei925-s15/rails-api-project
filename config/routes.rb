Rails.application.routes.draw do
  get("/homes/:the_home", { :controller => "pages", :action => "home" })

  get("/weather/:address", { :controller => "forecasts", :action => "location" })
end
