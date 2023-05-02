require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'tasks 4', tasks4: true do
    describe 'associations' do
      it { is_expected.to have_many(:projects).dependent(:nullify) }
      it { is_expected.to have_many(:issues).dependent(:restrict_with_error) }
    end

    describe 'validations' do
      it { is_expected.to validate_presence_of(:first_name) }
      it { is_expected.to validate_length_of(:first_name).is_at_least(1).is_at_most(255) }

      it { is_expected.to validate_presence_of(:last_name) }
      it { is_expected.to validate_length_of(:last_name).is_at_least(1).is_at_most(255) }

      it { is_expected.to validate_presence_of(:email) }
      it { is_expected.to validate_length_of(:email).is_at_least(1).is_at_most(255) }

      it { is_expected.to allow_value('john@doe.com').for(:email) }
      it { is_expected.not_to allow_value('john').for(:email) }
    end

    describe '#to_s' do
      let!(:user) { create(:user, email: 'john@doe.com') }

      it 'is concatenation of first_name and last_name' do
        expect(user.to_s).to eq("#{user.first_name} #{user.last_name}")
      end
    end
  end
end
