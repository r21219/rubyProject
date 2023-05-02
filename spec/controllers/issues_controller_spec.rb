require 'rails_helper'

RSpec.describe IssuesController, type: :controller do
  describe 'tasks 5', tasks5: true do
    describe 'permited params' do
      let!(:user1) { create(:user) }
      let!(:user2) { create(:user) }

      let!(:priority1) { create(:priority) }

      let!(:project1) { create(:project) }

      it do
        params = {
          issue: {
            subject: 'Task',
            description: 'Description',
            start_date: Date.current,
            due_date: Date.current + 1.day,
            status: :new,
            estimated_hours: 10,
            done_ratio: 10,
            priority_id: priority1.id,
            user_id: user1.id,
            project_id: project1.id,
            assigned_to_id: user1.id,
            user_ids: [user1.id, user2.id],
            time_entries_attributes: [{ user_id: user1.id, spent_on: Date.current, hours: 2, comments: 'comments' }],
            journals_attributes: [{ user_id: user1.id, notes: 'notes' }]
          }
        }

        should permit(
          :subject, :description, :start_date, :due_date, :status,
          :estimated_hours, :done_ratio, :priority_id, :user_id,
          :project_id, :assigned_to_id, user_ids: [],
          time_entries_attributes: [:user_id, :spent_on, :hours, :comments],
          journals_attributes: [:user_id, :notes]
        )
          .for(:create, params: params)
          .on(:issue)
      end
    end

    describe 'GET index' do
      it 'returns a successful response' do
        get :index

        expect(response).to be_successful
      end

      it 'renders the index template' do
        get :index

        expect(response).to render_template("index")
      end
    end
  end
end
