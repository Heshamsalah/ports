require 'rails_helper'

RSpec.describe 'Ports API', type: :request do
  context 'GET /ports' do
    let!(:ports) { create_list(:port, 50) }
    let(:port) { ports.last }

    it 'should retrieve paginated ports successfully' do
      get ports_url, params: { page: 1, per: 20 }

      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)['data'].count).to eq(20)
    end

    it 'should retrieve only 10 ports when page and/or per is not provided' do
      get ports_url

      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)['data'].count).to eq(10)
    end

    it 'should retrieve filtered ports' do
      params = {
        page: 1,
        per: 50
      }
      get ports_url, params: params.merge(port.attributes).except(:id)

      expect(response).to have_http_status(:ok)
      obj = JSON.parse(response.body)['data']
      expect(obj.count).to eq(1)
      expect(obj[0].symbolize_keys[:id].to_i).to eq(port.id)
    end
  end

  ##############################################################################
  context 'GET /ports/:id' do
    let!(:ports) { create_list(:port, 5) }
    let!(:port) { ports.first }

    it 'should get port by id' do
      get port_url(id: port.id)

      expect(response).to have_http_status(:ok)
      obj = JSON.parse(response.body)['data'].symbolize_keys
      expect(obj[:id].to_i).to eq(port.id)
    end
  end

  ##############################################################################
  context 'POST /ports' do
    let!(:ports) { create_list(:port, 5) }
    let(:params) { attributes_for(:port) }

    it 'should create port successfully' do
      post ports_url, params: params

      expect(response).to have_http_status(:created)
      obj = JSON.parse(response.body)['data'].deep_symbolize_keys
      expect(obj[:attributes][:code]).to eq(params[:code])
    end
  end

  ##############################################################################
  context 'PUT /ports/:id' do
    let!(:ports) { create_list(:port, 5) }
    let(:params) { attributes_for(:port) }

    it 'should update port successfully' do
      port = ports.last
      put port_url(id: port.id), params: params

      expect(response).to have_http_status(:ok)
      obj = JSON.parse(response.body)['data'].deep_symbolize_keys
      expect(obj[:id].to_i).to eq(port.id)
      expect(obj[:attributes][:name]).to eq(params[:name])
      expect(obj[:attributes][:code]).not_to eq(port.code)
    end
  end

  ##############################################################################
  context 'DELETE /ports/:id' do
    let!(:ports) { create_list(:port, 5) }
    it 'should delete port successfully' do
      port = ports.last
      delete port_url(id: port.id)

      expect(response).to have_http_status(:ok)
    end
  end
end
