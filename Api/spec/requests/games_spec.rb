require 'rails_helper'

RSpec.describe "Games", type: :request do
  describe "POST create" do
    context "with valid params" do
      before do
        post '/games/new'
      end
      it 'return a success response' do
        expect(response).to have_http_status(:created)
      end
      it 'responds with a json' do
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end
  end
end
