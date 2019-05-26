require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { create(:user) }

  context 'has a valid Factory' do
    it { is_expected.to be_valid }
  end

  context 'validations' do
    context 'presence' do
      it { is_expected.to validate_presence_of(:email) }
    end

    context 'uniqueness' do
      it { is_expected.to validate_uniqueness_of(:email) }
    end
  end
end
