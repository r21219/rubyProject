FactoryBot.define do
  factory :journal do
    notes { "Notes" }
    association(:user)
    association(:issue)
  end
end
