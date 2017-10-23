
require_relative('../models/transactions.rb')

get '/transactions' do
  @transactions = Transactions.all()
  erb(:index)
end
