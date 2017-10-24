
require_relative('../models/transactions.rb')
require_relative('../models/type.rb')
require_relative('../models/vendor.rb')

get '/transactions' do
  @transactions = Transactions.all()
  @vendors = Vendor.all()
  @types = Type.all()
  @total = Transactions.total()
  erb(:index)
end

get '/transactions/add' do
  @transactions = Transactions.all()
  @vendors = Vendor.all()
  @types = Type.all()
  erb(:add)
end

post '/transactions' do
  print params
  @transaction = Transactions.new(params)
  @transaction.save()
  erb(:create)
end
