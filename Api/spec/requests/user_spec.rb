require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /register" do
    it "returns http success" do
      get "/user/register"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /login" do
    it "returns http success" do
      get "/user/login"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /logout" do
    it "returns http success" do
      get "/user/logout"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/user/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/user/edit"
      expect(response).to have_http_status(:success)
    end
  end

end
