require 'rails_helper'

RSpec.describe Port, type: :model do
  subject(:port) { create(:port) }

  context 'has a valid Factory' do
    it { is_expected.to be_valid }
  end

  context 'validations' do
    context 'presence' do
      it { is_expected.to validate_presence_of(:code) }
      it { is_expected.to validate_presence_of(:name) }
      it { is_expected.to validate_presence_of(:lng) }
      it { is_expected.to validate_presence_of(:lat) }
      it { is_expected.to validate_presence_of(:port_type) }
      it { is_expected.to validate_presence_of(:port_hub) }
    end

    context 'numericality' do
      it { is_expected.to validate_numericality_of(:lng) }
      it { is_expected.to validate_numericality_of(:lat) }
    end
  end
end
