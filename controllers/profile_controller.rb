require('sinatra')
require('sinatra/contrib/all')

get '/' do
  @transactions = Transactions.all()
  @total = Transactions.total()
  erb(:home)
end
