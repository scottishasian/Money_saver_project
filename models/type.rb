require('pg')
require_relative('../db/sql_runner')

class Type

  attr_reader :name, :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO types (name)
           VALUES ($1)
           RETURNING *"
    values = [@name]
    result = SqlRunner.run(sql, values).first
    @id = result['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM types"
    values = []
    types = SqlRunner.run(sql, values)
    result = types.map { |type| Type.new(type)}
    return result
  end

  def delete()
    sql = "DELETE FROM types
           WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def update() #Come back to this.
    sql = "UPDATE types
           SET (name) = ($1)
           WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  def self.find(id)
    sql = "SELECT * FROM types
           WHERE id = $1"
    values = [id]
    types = SqlRunner.run(sql, values)
    result = Type.new(types.first)
    return result
  end

end
