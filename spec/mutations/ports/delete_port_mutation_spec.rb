require 'rails_helper'

RSpec.describe DeletePortMutation, type: :mutation do
  let(:ports) { create_list(:port, 10) }

  it 'should delete port successfully' do
    port_to_delete = ports.first
    params = {
      id: port_to_delete.id
    }
    outcome = DeletePortMutation.run(params)

    expect(outcome.success?).to be true
    expect(outcome.result).to eq(port_to_delete)
    expect(Port.count).to eq(9)
  end

  it 'should fail to delete port with invalid id' do
    params = {
      id: 'invalid_id'
    }
    expect { DeletePortMutation.run(params) }
      .to raise_exception(ActiveRecord::RecordNotFound)
  end
end
