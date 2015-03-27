require 'rails_helper'

RSpec.describe ForecastsController, type: :controller do
  describe "GET #location" do
    it "responds successfully" do
      get :location
      expect(response).to be_success
    end
  end
end
