require 'rails_helper'

RSpec.describe Project, type: :model do
  describe 'tasks 4', tasks4: true do
    describe 'associations' do
      it { is_expected.to belong_to(:user) }
      it { is_expected.to have_many(:issues).dependent(:destroy) }
    end

    describe 'validations' do
      it { is_expected.to validate_presence_of(:name) }
      it { is_expected.to validate_length_of(:name).is_at_least(1).is_at_most(255) }
      it { is_expected.to validate_presence_of(:user) }
    end

    describe 'actiontext' do
      it { is_expected.to have_rich_text(:content) }
    end

    describe '#to_s' do
      let!(:project) { create(:project, user: build(:user, email: 'john@doe.cz')) }

      it 'is same as name' do
        expect(project.to_s).to eq(project.name)
      end
    end
  end
end
