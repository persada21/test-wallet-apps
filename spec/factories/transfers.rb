FactoryBot.define do
  factory :transfer do 
    sender factory: :account
    receiver factory: :account

    amount { 1000 }
    sender_id { 1 }
    receiver_id { 2 }
  end
end
