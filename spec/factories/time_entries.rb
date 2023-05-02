FactoryBot.define do
  factory :time_entry do
    spent_on { "2023-03-08" }
    hours { 1.5 }
    comments { "MyString" }
    association(:user)
    association(:project)
    association(:issue)
  end
end
