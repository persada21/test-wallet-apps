FactoryBot.define do
  factory :stock do
    name { 'Top Up 1' }
    code { 'tp01' }
    stock_type { 'topup' }
    balance { 10_000_000_000 }
  end
end
