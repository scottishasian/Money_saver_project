require_relative('../models/transactions.rb')
require_relative('../models/type.rb')
require_relative('../models/vendor.rb')

get '/vendors' do
  erb(:"vendor/vendors")
end
