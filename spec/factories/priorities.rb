FactoryBot.define do
  factory :priority do
    name { ['Low', 'Normal', 'High', 'Urgent'].sample }
  end
end
