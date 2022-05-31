FactoryBot.define do
  factory :transaction_top_up, class: Transaction do
    grant_id { 1 }
    grant_type {'Top Up' }
    transactable_id { 1 } 
    transactable_type {'Account'} 
    subject { 'receiver' }
    
    association :grant, factory: :top_up
  end

  factory :transaction_transfer, class: Transaction do
    grant_id { 1 }
    grant_type {'Transfer' }
    transactable_id { 2 } 
    transactable_type { 'Account' } 
    subject { 'sender' }
    
    association :grant, factory: :transfer
    association :transactable, factory: :account
  end
end
