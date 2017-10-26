require('sinatra')
require('sinatra/contrib/all')

require_relative('./controllers/transaction_controller.rb')
require_relative('./controllers/profile_controller.rb')
require_relative('./controllers/vendor_controller.rb')
require_relative('./controllers/types_controller.rb')

get '/' do
  @transactions = Transactions.all()
  @budget = Budget.all()
  @total = Transactions.total()
  erb(:home)
end
