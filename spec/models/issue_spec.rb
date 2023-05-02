require 'rails_helper'

RSpec.describe Issue, type: :model do
  describe 'tasks 4', tasks4: true do
    describe 'enums' do
      it { is_expected.to define_enum_for(:status).with_values(new: 1, in_progress: 2, waiting: 3, solved: 4, closed: 5).with_prefix }
    end

    describe 'associations' do
      it { is_expected.to belong_to(:user) }
      it { is_expected.to belong_to(:project) }
      it { is_expected.to belong_to(:priority) }
      it { is_expected.to belong_to(:assigned_to).class_name('User') }

      it { is_expected.to have_many(:time_entries).dependent(:destroy) }
    end

    describe 'validations' do
      it { is_expected.to validate_presence_of(:subject) }
      it { is_expected.to validate_length_of(:subject).is_at_least(1).is_at_most(255) }

      it { is_expected.to validate_presence_of(:status) }
      it { is_expected.to validate_presence_of(:priority) }
      it { is_expected.to validate_presence_of(:start_date) }
      it { is_expected.to validate_presence_of(:due_date) }
      it { is_expected.to validate_presence_of(:project) }

      it { is_expected.to validate_presence_of(:estimated_hours) }
      it { is_expected.to validate_numericality_of(:estimated_hours).only_integer }

      it { is_expected.to validate_presence_of(:done_ratio) }
      it { is_expected.to validate_numericality_of(:done_ratio).is_greater_than_or_equal_to(0).is_less_than_or_equal_to(100) }
    end

    describe 'actiontext' do
      it { is_expected.to have_rich_text(:content) }
    end

    describe '#to_s' do
      let!(:issue) { create(:issue) }

      it 'is same as subject' do
        expect(issue.to_s).to eq(issue.subject)
      end
    end
  end

  describe 'tasks 5', tasks5: true do
    describe 'associations' do
      it { is_expected.to have_many(:watchers).dependent(:destroy) }
      it { is_expected.to have_many(:users).through(:watchers) }
      it { is_expected.to have_many(:time_entries).dependent(:destroy) }
      it { is_expected.to have_many(:journals).dependent(:destroy) }
    end

    describe 'nested attributes' do
      it { is_expected.to accept_nested_attributes_for(:journals) }
      it { is_expected.to accept_nested_attributes_for(:time_entries) }
    end

    describe 'callbacks' do
      describe 'before_update assing_changes' do
        it 'create journal and journal_details' do
          user = create(:user)
          issue = create(:issue, start_date: Date.current, due_date: Date.current)

          expect do
            issue.update(
              journals_attributes: [{ user_id: user.id, notes: 'abc' }],
              subject: 'task test 2',
              status: Issue.statuses[:solved]
            )
          end.to change { issue.journals.count }.from(0).to(1).and(
            change { JournalDetail.count }.from(0).to(2)
          )
        end
      end
    end
  end

  describe 'tasks 6', tasks6: true do
    describe 'validations' do
      context 'when end due_date is greater or equal than the start_date' do
        it "record is valid and doesn't add greater_than error to due_date attribute" do
          issue = build(:issue, start_date: Date.current, due_date: Date.current)

          expect(issue.valid?).to be true
          expect(issue.errors[:start_date]).to be_empty

          issue = build(:issue, start_date: Date.current, due_date: Date.tomorrow)

          expect(issue.valid?).to be true
          expect(issue.errors[:start_date]).to be_empty
        end
      end
    end
  end

  describe 'tasks 7', tasks7: true do
    let!(:issue) { create(:issue, start_date: Date.current, due_date: Date.current) }

    describe '#send_journal' do
      it 'sends email on issue update' do
        expect do
          issue.update(
            subject: 'task test 2',
            start_date: 1.day.ago.to_date,
            due_date: 14.days.from_now
          )
        end.to change { ActionMailer::Base.deliveries.count }.by(1)
      end
    end
  end
end
