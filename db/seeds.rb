require('pry')
require_relative('../models/vendor.rb')
require_relative('../models/type.rb')
require_relative('../models/transactions.rb')

Vendor.delete_all
Type.delete_all
Transactions.delete_all

vendor1 = Vendor.new('name' => 'Sainsburys')
vendor2 = Vendor.new('name' => 'The Gym')

vendor1.save
vendor2.save

type1 = Type.new('name' => 'Food')
type2 = Type.new('name' => 'Leisure')

type1.save
type2.save

transaction1 = Transactions.new({
  'amount' => '4.50',
  'name' => 'Fruit',
  'vendor_id' => vendor1.id,
  'type_id' => type1.id,
  'date_of_buy' => '2017-06-10'
})

transaction1.save

binding.pry
nil
