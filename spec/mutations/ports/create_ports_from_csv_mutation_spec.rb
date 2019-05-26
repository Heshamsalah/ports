require 'rails_helper'

RSpec.describe CreatePortsFromCsvMutation, type: :mutation do
  let(:airports_csv) { fixture_file_upload('/files/airports.csv') }

  it 'should create port successfully' do
    airports_csv_string = Base64.encode64(airports_csv.read)
    params = {
      csv_string: airports_csv_string
    }
    outcome = CreatePortsFromCsvMutation.run(params)

    ports = outcome.result
    expect(outcome.success?).to be true
    expect(ports.count).to be > 0
    expect(ports.first.attributes.symbolize_keys)
      .to have_key(:port_type)
  end
end
