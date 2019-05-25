require 'rails_helper'

RSpec.describe 'Ports API', type: :request do
  context 'GET /ports' do
    let!(:ports) { create_list(:port, 50) }
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
  end

  context 'GET /ports/:id' do
    let!(:ports) { create_list(:port, 5) }
    it 'should get port by id' do
      get port_url(id: ports.first.id)

      expect(response).to have_http_status(:ok)
    end
  end

  context 'POST /ports' do
    let!(:ports) { create_list(:port, 5) }
    let(:params) { attributes_for(:port) }
    it 'should create port successfully' do
      post ports_url, params: params

      expect(response).to have_http_status(:created)
    end

    # it 'should fail to create port with existing code' do
    #   params[:code] = ports.first.code
    #   post ports_url, params: params

    #   expect(response).to have_http_status(500)
    # end
  end

  context 'PUT /ports/:id' do
    let!(:ports) { create_list(:port, 5) }
    let(:params) { attributes_for(:port) }
    it 'should update port successfully' do
      port = ports.last
      put port_url(id: port.id), params: params

      expect(response).to have_http_status(:ok)
    end

    # it 'should fail to create port with invalid id' do
    #   put port_url(id: 'invalid_id'), params: params

    #   expect(response).to have_http_status(500)
    # end

    # it 'should fail to create port with existing code' do
    #   port = ports.first
    #   params[:code] = ports.second.code
    #   put port_url(id: port.id), params: params

    #   expect(response).to have_http_status(500)
    # end
  end

  context 'DELETE /ports/:id' do
    let!(:ports) { create_list(:port, 5) }
    it 'should delete port successfully' do
      port = ports.last
      delete port_url(id: port.id)

      expect(response).to have_http_status(:ok)
    end

    # it 'should fail to delete port with invalid id' do
    #   delete port_url(id: 'invalid_id')

    #   expect(response).to have_http_status(500)
    # end
  end
end
