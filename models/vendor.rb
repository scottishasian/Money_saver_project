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

  def self.all()
    sql = "SELECT * FROM vendors"
    values = []
    vendors = SqlRunner.run(sql, values)
    result = vendors.map { |vendor| Vendor.new(vendor)}
    return result
  end

  def self.find(id)
    sql = "SELECT * FROM vendors
           WHERE id = $1"
    values = [id]
    vendors = SqlRunner.run(sql, values)
    result = Vendor.new(vendors.first)
    return result
  end

  def update() #come back to
    sql = "UPDATE vendors
           SET (name) = ($1)
           WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end



end
