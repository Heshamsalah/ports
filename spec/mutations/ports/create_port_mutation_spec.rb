require 'rails_helper'

RSpec.describe CreatePortMutation, type: :mutation do
  let(:params) { attributes_for(:port) }
  let(:port) { create(:port) }

  it 'should create port successfully' do
    outcome = CreatePortMutation.run(params)

    port_object = outcome.result.attributes.symbolize_keys
    params[:lat] = params[:lat].to_s.to_d
    params[:lng] = params[:lng].to_s.to_d
    expect(port_object.except(:id, :created_at, :updated_at)).to eq(params)
  end

  it 'should fail to create port with existing code' do
    expect { CreatePortMutation.run(port.attributes) }
      .to raise_exception(ActiveRecord::RecordNotUnique)
  end
end
