
require_relative('../models/transactions.rb')
require_relative('../models/type.rb')
require_relative('../models/vendor.rb')

get '/transactions' do
  @transactions = Transactions.all()
  erb(:index)
end
