require 'rails_helper'

RSpec.describe ForecastsController, type: :controller do
  describe "GET #location" do
    it "responds successfully", points: 5 do
      get :location, address: @address
      expect(response).to be_success
    end
  end
end
