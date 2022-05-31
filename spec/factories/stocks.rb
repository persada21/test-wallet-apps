FactoryBot.define do
  factory :stock do
     name { 'Top Up 1' }
     code { 'tp01' }
     stock_type { 'topup' }
     balance { 10000000000 }
  end
end
