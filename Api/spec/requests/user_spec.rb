require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let(:user) { create :user }

  describe 'GET /register' do
    it 'returns http success' do
      post '/user/register', {
        email: 'user@email',
        name: 'username',
        password: '123456'
      }
      expect(response).to have_http_status(:success)
    end

    context 'invalid information' do
      it 'repeated email' do
        post '/user/register', {
          email: user.email,
          name: 'username',
          password: '123456'
        }
        expect(response).to have_http_status :bad_request
      end

      it 'name too short' do
        post '/user/register', {
          email: 'uaer@email',
          username: 'oi',
          password: '123456'
        }
        expect(response).to have_http_status :bad_request
      end

      it 'password too short' do
        post '/user/register', {
          email: 'user@email',
          name: 'username',
          password: '123'
        }
        expect(response).to have_http_status :bad_request
      end

      it 'no email' do
        post '/user/register', {
          name: 'username',
          password: '123456'
        }
        expect(response).to have_http_status :bad_request
      end

      it 'no name' do
        post '/user/register', {
          email: 'user@email',
          password: '123456'
        }
        expect(response).to have_http_status :bad_request
      end

      it 'no password' do
        post '/user/register', {
          email: 'user@email',
          name: 'username'
        }
        expect(response).to have_http_status :bad_request
      end
    end
  end

  describe 'GET /login' do
    it 'returns http success' do
      post '/user/login', {
        email: user.email,
        password: '123456'
      }
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /logout' do
    it 'returns http success' do
      delete '/user/logout', headers: {
        'X-User-Email': user.email,
        'X-User-Token': user.authentication_token
      }
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get '/user/show', headers: {
        'X-User-Email': user.email,
        'X-User-Token': user.authentication_token
      }
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /edit' do
    it 'returns http success' do
      get '/user/edit', {
        name: 'oi'
      }, headers: {
        'X-User-Email': user.email,
        'X-User-Token': user.authentication_token
      }
      expect(response).to have_http_status(:success)
      expect(user.name).to eql? 'oi'
    end
  end
end
