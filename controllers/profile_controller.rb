require_relative('../models/transactions.rb')
require_relative('../models/type.rb')
require_relative('../models/vendor.rb')
require_relative('../models/user.rb')

get '/' do
  @transactions = Transactions.all()
  @budget = Budget.all()
  @total = Transactions.total()
  erb(:home)
end
