require_relative('../models/transactions.rb')
require_relative('../models/type.rb')
require_relative('../models/vendor.rb')

get '/vendors' do
  @transactions = Transactions.all()
  @vendors = Vendor.all()
  @types = Type.all()
  erb(:"vendor/vendors")
end

post '/vendors' do
  @vendor = Vendor.new(params)
  @vendor.save()
  redirect '/vendors'
end

post '/vendors/:id/delete' do
  vendor = Vendor.find(params[:id])
  vendor.delete()
  redirect '/vendors'
end
