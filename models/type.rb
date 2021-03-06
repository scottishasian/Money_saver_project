require('pg')
require_relative('../db/sql_runner')

class Type

  attr_reader :id
  attr_accessor :type_name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @type_name = options['type_name']
  end

  def save()
    sql = "INSERT INTO types (type_name)
           VALUES ($1)
           RETURNING *"
    values = [@type_name]
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
           SET (type_name) = ($1)
           WHERE id = $2"
    values = [@type_name, @id]
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

  def self.delete_all()
    sql = "DELETE FROM types"
    values = []
    SqlRunner.run(sql, values)
  end

end
