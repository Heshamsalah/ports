require 'rails_helper'

RSpec.describe 'Sessions', type: :request do
  let!(:user) { create(:user) }
  let(:params) { attributes_for(:user) }

  it 'should signup using email and password' do
    params = {
      email: user.email,
      password: 'P@ssW0rd'
    }
    post login_url, params: params
    expect(response).to have_http_status(:ok)
    expect(JSON.parse(response.body).deep_symbolize_keys).to have_key(:token)
  end

  it 'should login with an existing email and password' do
    post signup_url, params: params
    expect(response).to have_http_status(:ok)
    expect(JSON.parse(response.body).deep_symbolize_keys).to have_key(:token)
  end
end
