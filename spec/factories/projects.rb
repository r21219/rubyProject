FactoryBot.define do
  factory :project do
    sequence(:name) { |n| "Project #{n}" }
    description { Faker::Lorem.sentences }
    association(:user)
  end
end
