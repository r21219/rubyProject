require 'rails_helper'

RSpec.describe IssueMailer, type: :mailer do
  describe 'tasks 7', tasks7: true do
    describe 'send_journal' do
      let!(:user1) { create(:user) }
      let!(:user2) { create(:user) }
      let!(:user3) { create(:user) }
      let!(:issue) { create(:issue, user: user1, assigned_to: user2, user_ids: [user1.id, user2.id, user3.id]) }

      let(:mail) { described_class.with(issue: issue).send_journal.deliver_now }

      it 'renders the subject' do
        expect(mail.subject).to eq("[#{issue.project.name} - ##{issue.id}] #{issue.subject}")
      end

      it 'renders the receiver as user, assigned_to and all watchers' do
        expect(mail.to).to match_array([user1.email, user2.email, user3.email])
      end

      it 'renders the sender email' do
        expect(mail.from).to eq(['noreply@rails.cz'])
      end

      it 'assigns #issueId' do
        expect(mail.body.encoded).to match("##{issue.id}")
      end

      it 'assigns project name' do
        expect(mail.body.encoded).to match(issue.project.name)
      end
    end
  end
end
