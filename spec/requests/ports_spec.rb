require 'rails_helper'

RSpec.describe 'Ports API', type: :request do
  let!(:user) { create(:user) }
  let(:header) { { Authorization: user.token } }

  context 'GET /ports' do
    let!(:ports) { create_list(:port, 50) }
    let(:port) { ports.last }

    it 'should retrieve paginated ports successfully' do
      get ports_url, params: { page: 1, per: 20 }, headers: header

      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)['data'].count).to eq(20)
    end

    it 'should retrieve only 10 ports when page and/or per is not provided' do
      get ports_url, headers: header

      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)['data'].count).to eq(10)
    end

    it 'should retrieve filtered ports' do
      params = {
        page: 1,
        per: 50
      }
      get ports_url, params: params.merge(port.attributes).except(:id),
                     headers: header

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
      get port_url(id: port.id), headers: header

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
      post ports_url, params: params, headers: header

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
      put port_url(id: port.id), params: params, headers: header

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
      delete port_url(id: port.id), headers: header

      expect(response).to have_http_status(:ok)
    end
  end

  ##############################################################################
  context 'POST /ports/batch_create_csv' do
    let(:airports_csv) { fixture_file_upload('/files/airports.csv') }
    let(:mixed_csv) { fixture_file_upload('/files/mixed.csv') }
    let(:seaports_csv) { fixture_file_upload('/files/seaports.csv') }

    it "should create ports from 'airports.csv' file" do
      airports_csv_string = Base64.encode64(airports_csv.read)
      post batch_create_csv_url, params: { csv_string: airports_csv_string },
                                 headers: header

      expect(response).to have_http_status(:ok)
      obj = JSON.parse(response.body)['data']
      expect(obj.count).to be > 0
      expect(obj.first.deep_symbolize_keys[:attributes])
        .to have_key(:oceans_insights_code)
    end

    it "should create ports from 'airports.csv' file" do
      mixed_csv_string = Base64.encode64(mixed_csv.read)
      post batch_create_csv_url, params: { csv_string: mixed_csv_string },
                                 headers: header

      expect(response).to have_http_status(:ok)
      obj = JSON.parse(response.body)['data']
      expect(obj.count).to be > 0
      expect(obj.first.deep_symbolize_keys[:attributes])
        .to have_key(:oceans_insights_code)
    end

    it "should create ports from 'airports.csv' file" do
      seaports_csv_string = Base64.encode64(seaports_csv.read)
      post batch_create_csv_url, params: { csv_string: seaports_csv_string },
                                 headers: header

      expect(response).to have_http_status(:ok)
      obj = JSON.parse(response.body)['data']
      expect(obj.count).to be > 0
      expect(obj.first.deep_symbolize_keys[:attributes])
        .to have_key(:oceans_insights_code)
    end
  end
end
