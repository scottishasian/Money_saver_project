require_relative('../models/transactions.rb')
require_relative('../models/type.rb')
require_relative('../models/vendor.rb')

get '/types' do
  @transactions = Transactions.all()
  @vendors = Vendor.all()
  @types = Type.all()
  erb(:"types/types")
end

post '/types' do
  @type = Type.new(params)
  @type.save()
  redirect '/types'
end

post '/types/:id/delete' do
  type = Type.find(params[:id])
  type.delete()
  redirect '/types'
end
