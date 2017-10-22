require('pg')
require_relative('../db/sql_runner')

class Transactions

  attr_reader :id, :amount, :name, :vendor_id, :type_id, :date_of_buy

  def initialize(options)
    @id = options['id'].to_i
    @amount = options['amount'].to_i
    @name = options['name']
    @vendor_id = options['vendor_id'].to_i
    @type_id = options['type_id'].to_i
    @date_of_buy = options['date_of_buy']
  end

  def save()
    sql =  "INSERT INTO transactions (amount, name, vendor_id, type_id, date_of_buy)
            VALUES ($1, $2, $3, $4, $5)
            RETURNING *"
    values = [@amount, @name, @vendor_id, @type_id, @date_of_buy]
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
           SET (amount, name, date_of_buy) = ($1, $2, $3)
           WHERE id = $4"
    values = [@amount, @name, @date_of_buy, @id]
    SqlRunner.run(sql, values)
  end



#need to delete cascade on sql.



end
