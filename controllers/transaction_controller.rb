
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

get '/transactions/sort_by_type' do
  @transactions = Transactions.all()
  erb(:type_sorted)
end

post '/transactions/sort_by_type' do
  @transactions = Transactions.find_type_by_name(params["name"])
  @total = Transactions.total_by_type(params["name"])
  erb(:type_sorted)
end

get '/transactions/sort_by_vendor' do
  @transactions = Transactions.all()
  erb(:vendor_sorted)
end

post '/transactions/sort_by_vendor' do
  @transactions = Transactions.find_vendor_by_name(params["name"])
  @total = Transactions.total_by_vendor(params["name"])
  erb(:vendor_sorted)
end


# get '/transactions/sort_by_type/:name' do
#   Transactions.by_name(params["name"])
#   erb(:type_sorted)
# end

post '/transactions' do
  @transaction = Transactions.new(params)
  @transaction.save()
  erb(:create)
end

post '/transactions/:id/delete' do
  transaction = Transactions.find(params[:id])
  transaction.delete()
  redirect '/transactions'
end
