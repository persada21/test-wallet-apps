FactoryBot.define do
  factory :user do |f|
    f.username { Faker::Name.name }
    f.name { Faker::Internet.name }
    f.phone_number { Faker::Number.number(digits: 12) }
    f.birth_date { Faker::Time.between(from: 1000.days.ago, to: Time.now) }
  end
end
