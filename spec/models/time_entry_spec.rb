require 'rails_helper'

RSpec.describe TimeEntry, type: :model do
  describe 'tasks 4', tasks4: true do
    describe 'associations' do
      it { is_expected.to belong_to(:user) }
      it { is_expected.to belong_to(:project) }
      it { is_expected.to belong_to(:issue) }
    end

    describe 'validations' do
      it { is_expected.to validate_presence_of(:spent_on) }

      it { is_expected.to validate_presence_of(:comments) }

      it { is_expected.to validate_presence_of(:hours) }
      it { is_expected.to validate_numericality_of(:hours) }

      it { is_expected.to validate_presence_of(:issue) }
      it { is_expected.to validate_presence_of(:user) }
      it { is_expected.to validate_presence_of(:project) }
    end
  end

  describe 'tasks 5', tasks5: true do
    describe 'callbacks' do
      describe 'before_validation assign_project' do
        it 'assign project' do
          project = create(:project)
          issue = create(:issue, project: project)
          time_entry = build(:time_entry, issue: issue)

          expect { time_entry.save }.to change(time_entry, :project_id).from(nil).to(project.id)
        end
      end
    end
  end
end
