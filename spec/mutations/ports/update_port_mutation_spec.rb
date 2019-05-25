require 'rails_helper'

RSpec.describe UpdatePortMutation, type: :mutation do
  let(:ports) { create_list(:port, 5) }
  let(:port) { ports.first }
  let(:params) { attributes_for(:port) }

  it 'should retrieve port by id successfully' do
    outcome = UpdatePortMutation.run(params.merge(id: port.id))

    port_object = outcome.result.attributes.symbolize_keys.except(
      :id, :created_at
    )
    params[:lat] = params[:lat].to_s.to_d
    params[:lng] = params[:lng].to_s.to_d

    expect(port_object.except(:updated_at)).to eq(params)
    expect(port_object[:updated_at]).not_to eq(port.updated_at)
    expect(outcome.result).to eq(port.reload)
  end

  it 'should fail to update port with invalid id' do
    expect { UpdatePortMutation.run(params.merge(id: 'invalid_id')) }
      .to raise_exception(ActiveRecord::RecordNotFound)
  end

  it 'should fail to update port with existing code' do
    params[:code] = ports.last.code
    expect { UpdatePortMutation.run(params.merge(id: port.id)) }
      .to raise_exception(ActiveRecord::RecordNotUnique)
  end
end
