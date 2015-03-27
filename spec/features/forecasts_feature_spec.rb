require 'rails_helper'

RSpec.describe 'Forecasts feature', type: :feature do

  describe "GET /weather/:address" do
    before do
      @address = '1600+Pennsylvania+Ave+NW'
      maps_url = "https://maps.googleapis.com/maps/api/geocode/json?address=#{@address}"
      stub_request(:any, maps_url).to_return(body: File.new('spec/maps_response_body.txt'), status: 200)

      @lat = '38.8976757'
      @lng = '-77.03652799999999'
      forecasts_url = "https://api.forecast.io/forecast/1eca96eac95b937d4da06737228bb716/#{@lat},#{@lng}"
      stub_request(:any, forecasts_url).to_return(body: File.new('spec/forecasts_response_body.txt'), status: 200)

      visit "/weather/#{@address}"
    end

    context 'main exercise' do
      it "displays the content from :address params" do
        expect(page).to have_content(@address)
      end

      it "displays the current temperature for the :address" do
        temp = '46.84'
        expect(page).to have_content(temp)
      end

      it "displays the next hour's outlook for the :address" do
        outlook = 'Partly Cloudy'
        expect(page).to have_content(outlook)
      end

      it "displays the next day's outlook for the :address" do
        outlook = 'Mostly cloudy throughout the day.'
        expect(page).to have_content(outlook)
      end
    end

    context 'optional exercise' do
      it "links to bootstrap" do
        expect(page).to have_content('bootstrap.min.css')
      end

      it "links to google maps api" do
        expect(page).to have_content('https://maps.googleapis.com/maps/api/js?v=3.exp')
      end
    end
  end
end
