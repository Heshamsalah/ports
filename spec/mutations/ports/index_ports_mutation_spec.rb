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
end
