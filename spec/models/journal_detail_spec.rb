require 'rails_helper'

RSpec.describe JournalDetail, type: :model do
  describe 'tasks 5', tasks5: true do
    describe 'associations' do
      it { is_expected.to belong_to(:journal) }
    end
  end
end
