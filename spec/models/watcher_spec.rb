require 'rails_helper'

RSpec.describe Watcher, type: :model do
  describe 'tasks 5', tasks4: true do
    describe 'associations' do
      it { is_expected.to belong_to(:issue) }
      it { is_expected.to belong_to(:user) }
    end
  end
end
