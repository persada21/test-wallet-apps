FactoryBot.define do
  factory :account do |f|
    association :user
    f.number { Faker::Number.number(digits: 8) }
    f.balance { 5000 }
  end
end
