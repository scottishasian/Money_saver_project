require('pg')
require_relative('../db/sql_runner')

class Budget

  attr_accessor :budget

  def initialize(options)
    @budget = options['budget'].to_f
  end

  def save()
    sql = "INSERT INTO budget (budget)
           VALUES ($1)
           RETURNING *"
    values = [@budget]
    result = SqlRunner.run(sql, values).first
    @id = result['id'].to_i
  end

  def update()
    sql = "UPDATE budget
           SET (budget) = ($1)
           WHERE id = $2"
    values = [@budget, @id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM budget"
    values = []
    money = SqlRunner.run(sql, values)
    result = money.map { |funds| Budget.new(funds)}
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM budget"
    values = []
    SqlRunner.run(sql, values)
  end

end

#This has been made to allow the user to enter their own budget.
