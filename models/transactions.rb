require('pg')
require_relative('../db/sql_runner')
require_relative('type.rb')

class Transactions

  attr_reader :id
  attr_accessor :amount, :description, :vendor_id, :type_id, :date_of_buy

  def initialize(options)
    @id = options['id'].to_i
    @amount = options['amount'].to_f
    @description = options['description']
    @vendor_id = options['vendor_id'].to_i
    @type_id = options['type_id'].to_i
    @date_of_buy = options['date_of_buy']
  end

  def save()
    sql =  "INSERT INTO transactions (amount, description, vendor_id, type_id, date_of_buy)
            VALUES ($1, $2, $3, $4, $5)
            RETURNING *"
    values = [@amount, @description, @vendor_id, @type_id, @date_of_buy]
    result = SqlRunner.run(sql, values).first
    @id = result['id'].to_i
  end

  def delete()
    sql = "DELETE FROM transactions
           WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM transactions"
    values = []
    SqlRunner.run(sql, values)
  end

  def update()
    sql = "UPDATE transactions
           SET (amount, description, date_of_buy) = ($1, $2, $3)
           WHERE id = $4"
    values = [@amount, @description, @date_of_buy, @id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM transactions ORDER BY date_of_buy DESC"
    values = []
    spend = SqlRunner.run(sql, values)
    transactions_as_objects = spend.map{|money| Transactions.new(money)}
    return transactions_as_objects
  end


#-------------------------Find methods----------------------------

  def type()
    sql = "SELECT * FROM types
           WHERE id = $1"
    values = [@type_id]
    result = SqlRunner.run(sql, values)
    type_info = result[0]
    type_details = Type.new(type_info)
    return type_details.type_name
  end

  def vendor_name()
    sql = "SELECT * FROM vendors
           WHERE id = $1"
    values = [@vendor_id]
    result = SqlRunner.run(sql, values)
    vendor_info = result[0]
    vendor_details = Vendor.new(vendor_info)
    return vendor_details.vendor_name
  end

  def self.find(id)
    sql = "SELECT * FROM transactions
           WHERE id = $1"
    values = [id]
    transaction = SqlRunner.run(sql, values)
    result = Transactions.new(transaction.first)
    return result
  end

  def self.find_vendor_by_name(name)
    sql = "SELECT vendors.vendor_name, transactions.* FROM vendors
           INNER JOIN transactions
           ON vendors.id = transactions.vendor_id
           WHERE vendor_name = $1"
    values = [name]
    transaction = SqlRunner.run(sql, values)
    result = transaction.map { |order| Transactions.new(order)}
    return result
  end

  def self.find_type_by_name(name)
    sql = "SELECT types.type_name, transactions.* FROM types
           INNER JOIN transactions
           ON types.id = transactions.type_id
           WHERE type_name = $1"
    values = [name]
    type = SqlRunner.run(sql, values)
    result = type.map { |tag| Transactions.new(tag)}
    return result
  end

  def self.sort_by_type(id)
    sql = "SELECT * FROM types
           WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    type = result.map { |tag| Transactions.new(tag)}
    return type
  end


#---------totals-----------

  def self.total()
    sql = "SELECT SUM(amount) from transactions;"
    values = []
    result = SqlRunner.run(sql, values)
    return result.first()["sum"].to_f
    # SQL way, help from Darren

    # all_trans = self.all()
    # return all_trans.sum {|val| val.amount } #Ruby way, takes more memory
  end

  #spend by types (SQL way)
  def self.total_by_type(name)
    sql = "SELECT SUM(transactions.amount) FROM types
           INNER JOIN transactions
           ON types.id = transactions.type_id
           WHERE type_name = $1"
    values = [name]
    result = SqlRunner.run(sql, values)
    return result.first()["sum"].to_f
  end


  #spend by vendor (Ruby way)
  def self.total_by_vendor(name)
    list = self.find_vendor_by_name(name) #calls vendor_name function for list.
    return list.sum {|cost| cost.amount}
  end





end
