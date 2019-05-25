require 'rails_helper'

RSpec.describe ShowPortMutation, type: :mutation do
  let(:ports) { create_list(:port, 10) }

  it 'should retrieve port by id successfully' do
    params = {
      id: ports.first.id
    }
    outcome = ShowPortMutation.run(params)

    expect(ports.pluck(:id)).to include(outcome.result.id)
  end

  it 'should fail to get port with invalid id' do
    params = {
      id: 'invalid_id'
    }
    expect { ShowPortMutation.run(params) }
      .to raise_exception(ActiveRecord::RecordNotFound)
  end
end
