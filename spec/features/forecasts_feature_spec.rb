require 'rails_helper'

RSpec.describe 'Forecasts feature', type: :feature do

  describe "GET /weather/:address" do
    before do
      visit "/weather/#{@address}"
    end

    context 'Main Exercise' do
      it "displays the content from :address params", points: 5 do
        expect(page).to have_content(/#{Regexp.quote(@address)}|#{Regexp.quote(@address.gsub('+', ' '))}/i)
      end

      it "displays the current temperature for the :address", points: 5 do
        temp = '46'
        expect(page).to have_content(temp)
      end

      it "displays the next hour's outlook for the :address", points: 5 do
        outlook = 'Partly Cloudy'
        expect(page).to have_content(/#{Regexp.quote(outlook)}/i)
      end

      it "displays the next day's outlook for the :address", points: 5 do
        outlook = 'Mostly cloudy throughout the day'
        expect(page).to have_content(/#{Regexp.quote(outlook)}/i)
      end

      it "displays the next week's outlook for the :address", points: 5 do
        outlook = 'Light rain tomorrow through Saturday, with temperatures peaking at 69°F on Thursday'
        expect(page).to have_content(/#{Regexp.quote(outlook)}/i)
      end
    end

    context 'Optional Exercise' do
      it "uses bootstrap", points: 5 do
        expect(page).to have_selector("link[href*='bootstrap.min.css']", visible: false)
      end

      it "uses google maps api", points: 5 do
        expect(page).to have_selector("script[src*='maps.googleapis.com/maps/api/js']", visible: false)
      end
    end
  end
end
