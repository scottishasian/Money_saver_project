require('sinatra')
require('sinatra/contib/all')
require_relative('./models/transactions')

get '/transactions' do
  @transactions = Transactions.all()
  erb(:index)
end
