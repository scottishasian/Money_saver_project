require('pg')
require_relative('../db/sql_runner')

class Vendor
  attr_reader :name, :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO vendors (
           name
           )

           VALUES ($1)
           RETURNING *"
    values = [@name]
    result = SqlRunner.run(sql, values).first
    @id = result['id'].to_i
  end

  def delete()
    sql = "DELETE FROM vendors
           WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

end
