require_relative('../models/transactions.rb')
require_relative('../models/type.rb')
require_relative('../models/vendor.rb')

get '/' do
  @transactions = Transactions.all()
  @total = Transactions.total()
  @spend = Transactions.check_spending()
  erb(:home)
end
