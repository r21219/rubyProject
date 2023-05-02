FactoryBot.define do
  factory :issue do
    sequence(:subject) { |n| "Issue #{n}" }
    description { "Desc" }
    start_date { Date.current }
    due_date { Date.current + 7.days }
    status { 1 }
    estimated_hours { 10 }
    done_ratio { 0 }
    association(:priority)
    association(:user)
    association(:project)
    association(:assigned_to, factory: :user)
  end
end
