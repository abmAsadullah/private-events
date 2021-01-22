require 'rails_helper'

RSpec.describe 'Events', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/events'
      expect(response).to render_template(:index)
    end
  end

  describe 'GET /new' do
    it 'redirects to sign in if not signed' do
      get '/events/new'
      expect(response).to redirect_to(new_user_session_path)
    end
  end
end
