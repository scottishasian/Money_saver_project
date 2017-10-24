require_relative('../models/transactions.rb')
require_relative('../models/type.rb')
require_relative('../models/vendor.rb')

get '/types' do
  @transactions = Transactions.all()
  @vendors = Vendor.all()
  @types = Type.all()
  erb(:"types/types")
end
