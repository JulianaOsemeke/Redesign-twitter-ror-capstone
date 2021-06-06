require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /home" do
    it "returns http success" do
      get "/users/home"
      expect(response).to have_http_status(:success)
    end
  end

end
