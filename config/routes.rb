Rails.application.routes.draw do
  # get("/coordinates/:address", { :controller => "pages", :action => "home" })

  get("/weather/:address", { :controller => "forecasts", :action => "location" })
end
