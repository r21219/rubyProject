require 'rails_helper'

RSpec.describe Priority, type: :model do
  describe 'tasks 4', tasks4: true do
    describe 'associations' do
      it { is_expected.to have_many(:issues).dependent(:restrict_with_error) }
    end

    describe 'validations' do
      it { is_expected.to validate_presence_of(:name) }
      it { is_expected.to validate_length_of(:name).is_at_least(1).is_at_most(255) }
      it { is_expected.to validate_uniqueness_of(:name).case_insensitive }
    end

    describe '#to_s' do
      let!(:priority) { create(:priority) }

      it 'is same as name' do
        expect(priority.to_s).to eq(priority.name)
      end
    end
  end
end
