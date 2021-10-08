require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let(:user) { create :user }

  describe 'POST /register' do
    it 'returns http success' do
      post '/user/register', params: {
        email: 'user@email',
        name: 'username',
        password: '123456'
      }
      expect(response).to have_http_status :success
    end

    context 'invalid information' do
      it 'repeated email' do
        post '/user/register', params: {
          email: user.email,
          name: 'username',
          password: '123456'
        }
        expect(response).to have_http_status :bad_request
      end

      it 'name too short' do
        post '/user/register', params: {
          email: 'uaer@email',
          username: 'oi',
          password: '123456'
        }
        expect(response).to have_http_status :bad_request
      end

      it 'password too short' do
        post '/user/register', params: {
          email: 'user@email',
          name: 'username',
          password: '123'
        }
        expect(response).to have_http_status :bad_request
      end

      it 'no email' do
        post '/user/register', params: {
          name: 'username',
          password: '123456'
        }
        expect(response).to have_http_status :bad_request
      end

      it 'no name' do
        post '/user/register', params: {
          email: 'user@email',
          password: '123456'
        }
        expect(response).to have_http_status :bad_request
      end

      it 'no password' do
        post '/user/register', params: {
          email: 'user@email',
          name: 'username'
        }
        expect(response).to have_http_status :bad_request
      end
    end
  end

  describe 'POST /login' do
    it 'returns http success' do
      post '/user/login', params: {
        email: user.email,
        password: '123456'
      }
      expect(response).to have_http_status :success
    end

    context 'invalid information' do
      it 'invalid email' do
        post '/user/login', params: {
          email: 'oi@oi',
          password: '123456'
        }
        expect(response).to have_http_status :not_found
      end

      it 'invalid password' do
        post '/user/login', params: {
          email: user.email,
          password: '1234567'
        }
        expect(response).to have_http_status :unauthorized
      end
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
