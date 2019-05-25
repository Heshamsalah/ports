require 'rails_helper'

RSpec.describe IndexPortsMutation, type: :mutation do
  let!(:ports) { create_list(:port, 50) }

  it 'should retrieve ports successfully' do
    params = {
      page: 1,
      per: 20
    }
    outcome = IndexPortsMutation.run(params)

    expect(outcome.result.count).to eq(params[:per])
  end

  context 'Filter Ports Successfuly' do
    let(:port) { ports.first }
    let(:params) do
      {
        page: 1,
        per: 50,
      }
    end
    it 'should filter ports by id' do
      outcome = IndexPortsMutation.run(params.merge(id: port.id))

      expect(outcome.result.count).to eq(1) 
      expect(outcome.result.first).to eq(port)      
    end

    it 'should filter ports by code' do
      params = {
        code: port.code
      }
      outcome = IndexPortsMutation.run(params.merge(code: port.code))

      expect(outcome.result.count).to eq(1) 
      expect(outcome.result.first).to eq(port)
    end

    it 'should filter ports by name' do
      outcome = IndexPortsMutation.run(params.merge(name: port.name))

      expect(outcome.result).to include(port)
    end

    it 'should filter ports by port_type' do
      outcome = IndexPortsMutation.run(params.merge(port_type: port.port_type))

      expect(outcome.result).to include(port)
    end

    it 'should filter ports by city' do
      outcome = IndexPortsMutation.run(params.merge(city: port.city))

      expect(outcome.result).to include(port)
    end

    it 'should filter ports by created_at date range' do
      from = 2.days.ago.utc
      to = Time.now.utc + 1.hour
      outcome = IndexPortsMutation.run(
        params.merge(from_date: from.to_s, to_date: to.to_s)
      )

      expect(Date.parse(outcome.result.pluck(:created_at).max.to_s))
        .to be >= Date.parse(from.to_s)
      expect(Date.parse(outcome.result.pluck(:created_at).min.to_s))
        .to be <= Date.parse(to.to_s)
    end

    it 'should filter ports by oceans_insights_code' do
      outcome = IndexPortsMutation.run(
        params.merge(oceans_insights_code: port.oceans_insights_code)
      )

      expect(outcome.result).to include(port)
    end

    it 'should filter ports by ocean_insights' do
      outcome = IndexPortsMutation.run(
        params.merge(ocean_insights: port.ocean_insights)
      )

      expect(outcome.result).to include(port)
    end

    it 'should filter ports by big_schedules' do
      outcome = IndexPortsMutation.run(
        params.merge(big_schedules: port.big_schedules)
      )

      expect(outcome.result).to include(port)
    end

    it 'should filter ports by latitude and longitude' do
      outcome = IndexPortsMutation.run(
        params.merge(
          lng: port.lng,
          lat: port.lat
        )
      )

      expect(outcome.result).to include(port)
    end
  end
end
