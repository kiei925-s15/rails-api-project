# Rails API Project

## Setup

First **fork** and *then* clone this repository.

`cd` into the folder you just cloned and run the following commands:

    bundle install

    rails server

If it worked, you should be able to navigate to [http://localhost:3000](http://localhost:3000) and see something there. If it didn't work, make sure you don't have any old servers running in other tabs or windows. **Ctrl-C** to shut down running Rails servers.

## Goal:

As described on the application's [home page](http://localhost:3000), I want you to make links like these work:

 - [http://localhost:3000/weather/5807+S+Woodlawn+Ave](http://localhost:3000/weather/5807+S+Woodlawn+Ave)
 - [http://localhost:3000/weather/450+N+Cityfront+Plaza+Dr+Chicago+IL+60611](http://localhost:3000/weather/450+N+Cityfront+Plaza+Dr+Chicago+IL+60611)

In order to do this, you will need to first complete the RCAV for that URL (I started it off in `routes.rb`).

Then, in your `ForecastsController` file, add the following to the very top:

    require 'open-uri'
    require 'json'

You are now ready to read from the Google Geocoding API and Forecast API as you did last week in the API projects.

Inside the `location`  action, do all the work you need to

 - retrieve the user input (whatever they typed after the slash)
 - exchange it for a lat/lng pair from the Geocoding API
 - exchange the lat/lng pair for weather info from the Forecast API
 - place any values that you want to show the user in instance variables
 - write some HTML around the instance variables in the view template

At the end of the day, if I visit

[http://localhost:3000/weather/5807+S+Woodlawn+Ave](http://localhost:3000/weather/5807+S+Woodlawn+Ave)

I should see something like

> The current temperature at **5807+S+Woodlawn+Ave** is **46.6** degrees.
>
> The outlook for the next 60 minutes is: **Clear for the hour.**
>
> The outlook for the next 24 hours is: **Mostly cloudy starting tomorrow morning.**
> The outlook for the rest of the week is: **No precipitation throughout the week, with temperatures rising to 64°F on Saturday.**


#### For fun, optional exercises

##### Bootstrap (*Easier*)

`<link>` to [Bootstrap](http://www.bootstrapcdn.com/#quickstart_tab) or a [Bootswatch](http://www.bootstrapcdn.com/#bootswatch_tab) in the `<head>` of your pages (located in `app/views/layouts/application.html.erb`), and make things look prettier.

##### Google Map (*Harder*)

Embed a Google map in the view, centered on the provided address. Refer to the docs:

https://developers.google.com/maps/documentation/javascript/examples/map-simple

The key concept is, just like with Bootstrap, to first paste in the example markup and see if it works.

Then, replace whichever part of the static markup you want to with embedded Ruby tags that contain your dynamic values.
