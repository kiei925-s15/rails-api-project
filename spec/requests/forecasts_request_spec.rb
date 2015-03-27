require 'rails_helper'

RSpec.describe 'Forecasts requests', type: :request do

  describe "GET /weather/:address" do
    it "renders the correct template" do
      Zodiac.all.each do |zodiac|
        get "/signs/5807+S+Woodlawn+Ave"
        expect(response).to render_template(:location)
      end
    end
  end
end
