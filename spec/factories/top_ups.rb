FactoryBot.define do
  factory :top_up do
    sender factory: :stock
    receiver factory: :account

    amount { 5000 }
  end
end
