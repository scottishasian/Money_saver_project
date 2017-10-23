require('pry')
require_relative('../models/vendor.rb')
require_relative('../models/type.rb')
require_relative('../models/transactions.rb')

Vendor.delete_all
Type.delete_all
Transactions.delete_all

vendor1 = Vendor.new('vendor_name' => 'Sainsburys')
vendor2 = Vendor.new('vendor_name' => 'The Gym')
vendor3 = Vendor.new('vendor_name' => 'The Voodoorooms')
vendor4 = Vendor.new('vendor_name' => 'Moneybox')

vendor1.save
vendor2.save
vendor3.save
vendor4.save

type1 = Type.new('type_name' => 'Food')
type2 = Type.new('type_name' => 'Leisure')
type3 = Type.new('type_name' => 'Finance')
type4 = Type.new('type_name' => 'Sport/Exercise')

type1.save
type2.save
type3.save
type4.save

transaction1 = Transactions.new({
  'amount' => '4.50',
  'description' => 'Fruit',
  'vendor_id' => vendor1.id,
  'type_id' => type1.id,
  'date_of_buy' => '2017-06-10'
})

transaction2 = Transactions.new({
  'amount' => '22.50',
  'description' => 'Weekend drinks',
  'vendor_id' => vendor3.id,
  'type_id' => type2.id,
  'date_of_buy' => '2017-06-20'
})

transaction3 = Transactions.new({
  'amount' => '19.50',
  'description' => 'Gym membership',
  'vendor_id' => vendor2.id,
  'type_id' => type4.id,
  'date_of_buy' => '2017-06-09'
})

transaction4 = Transactions.new({
  'amount' => '10.00',
  'description' => 'Investment',
  'vendor_id' => vendor4.id,
  'type_id' => type3.id,
  'date_of_buy' => '2017-07-30'
})

transaction5 = Transactions.new({
  'amount' => '100.00',
  'description' => 'Cheese Board',
  'vendor_id' => vendor1.id,
  'type_id' => type2.id,
  'date_of_buy' => '2017-07-21'
})

transaction6 = Transactions.new({
  'amount' => '40.06',
  'description' => 'Chicken Nuggets',
  'vendor_id' => vendor1.id,
  'type_id' => type1.id,
  'date_of_buy' => '2017-07-21'
})

transaction1.save
transaction2.save
transaction3.save
transaction4.save
transaction5.save
transaction6.save

binding.pry
nil
