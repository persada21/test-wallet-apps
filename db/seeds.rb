puts "Seeding Data"
puts "=============="
puts
10.times do |index|
  User.create(
    username: "lorem_user_#{index}",
    name: Faker::Name.unique.name,
    phone_number: Faker::PhoneNumber.unique.cell_phone_in_e164
  )
end

Stock.create(name: 'Top Up 1', code: 'tp01', stock_type: :deposit, balance: 3500)
Stock.create(name: 'Top Up 2', code: 'tp02', stock_type: :deposit, balance: 3500)
Stock.create(name: 'Withdraw 1', code: 'wd01', stock_type: :withdraw, balance: 2000)
puts
puts
puts "Done!"




