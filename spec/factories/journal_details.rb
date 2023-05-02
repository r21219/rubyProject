FactoryBot.define do
  factory :journal_details do
    property { 'subject' }
    old_value { 'old' }
    value { 'new' }
    association(:journal)
  end
end
