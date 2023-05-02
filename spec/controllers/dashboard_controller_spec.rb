require 'rails_helper'

RSpec.describe DashboardController, type: :controller do
  describe 'tasks 5', tasks5: true do
    describe 'GET index' do
      it 'returns a successful response' do
        get :index

        expect(response).to be_successful
      end

      it 'assigns @issues' do
        priority = create(:priority)
        issue1 = create(:issue, status: 'closed', priority: priority)
        issue2 = create(:issue, status: 'new', priority: priority, due_date: Date.current + 7.days)
        issue3 = create(:issue, status: 'in_progress', priority: priority, due_date: Date.current + 1.days)
        issue4 = create(:issue, status: 'solved', priority: priority, due_date: Date.current)

        get :index

        expect(assigns(:issues)).to match_array([issue4, issue3, issue2])
      end

      it 'renders the index template' do
        get :index

        expect(response).to render_template("index")
      end
    end
  end
end
