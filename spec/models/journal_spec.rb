require 'rails_helper'

RSpec.describe Journal, type: :model do
  describe 'tasks 5', tasks5: true do
    describe 'associations' do
      it { is_expected.to belong_to(:user) }
      it { is_expected.to belong_to(:issue) }

      it { is_expected.to have_many(:journal_details).dependent(:destroy) }
    end

    describe 'actiontext' do
      it { is_expected.to have_rich_text(:notes) }
    end
  end
end
