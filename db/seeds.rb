require('pry')
require_relative('../models/vendor.rb')
require_relative('../models/type.rb')

vendor1 = Vendor.new('name' => 'Sainsburys')
vendor2 = Vendor.new('name' => 'The Gym')

type1 = Type.new('name' => 'Food')
type2 = Type.new('name' => 'Leiusure')

binding.pry
nil
