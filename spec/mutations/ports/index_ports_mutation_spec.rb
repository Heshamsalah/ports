require 'rails_helper'

RSpec.describe IndexPortsMutation, type: :mutation do
  let!(:ports) { create_list(:port, 50) }

  it 'should retrieve ports successfully' do
    outcome = IndexPortsMutation.run

    expect(outcome.result.count).to eq(ports.count)
  end
end
