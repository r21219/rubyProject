FactoryBot.define do
  factory :watcher do
    association(:user)
    association(:issue)
  end
end
