require 'rails_helper'

RSpec.describe ExampleController, type: :request do
  describe 'GET /show' do
    let!(:user) { create(:user) }

    before do
      get "/example/#{user.id}.json"
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
  end
end
