require('pry')
require_relative('../models/vendor.rb')

vendor1 = Vendor.new('name' => 'Sainsburys')
vendor2= Vendor.new('name' => 'The Gym')

binding.pry
nil
