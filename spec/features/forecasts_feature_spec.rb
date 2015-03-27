require 'rails_helper'

RSpec.describe 'Forecasts feature', type: :feature do

  describe "GET /weather/:address" do
    before do
      visit "/weather/#{@address}"
    end

    context 'Main Exercise' do
      it "displays the content from :address params" do
        expect(page).to have_content(/#{Regexp.quote(@address)}|#{Regexp.quote(@address.gsub('+', ' '))}/i)
      end

      it "displays the current temperature for the :address" do
        temp = '46'
        expect(page).to have_content(temp)
      end

      it "displays the next hour's outlook for the :address" do
        outlook = 'Partly Cloudy'
        expect(page).to have_content(/#{Regexp.quote(outlook)}/i)
      end

      it "displays the next day's outlook for the :address" do
        outlook = 'Mostly cloudy throughout the day.'
        expect(page).to have_content(/#{Regexp.quote(outlook)}/i)
      end
    end

    context 'Optional Exercise' do
      it "uses bootstrap" do
        pending 'check bootstrap implementation separately'
        expect(page).to have_content('bootstrap.min.css')
      end

      it "uses google maps api" do
        pending 'check google maps api implementation separately'
        expect(page).to have_content('https://maps.googleapis.com/maps/api/js?v=3.exp')
      end
    end
  end
end
