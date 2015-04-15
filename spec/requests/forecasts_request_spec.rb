require 'rails_helper'

RSpec.describe 'Forecasts requests', type: :request do

  describe "GET /weather/:address" do
    it "renders the correct template", points: 5 do
      get "/weather/#{@address}"
      expect(response).to render_template(:location)
    end
  end
end
