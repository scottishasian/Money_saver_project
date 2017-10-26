require('pg')
require_relative('../db/sql_runner')

class Vendor
  attr_reader :id
  attr_accessor :vendor_name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @vendor_name = options['vendor_name']
  end

  def save()
    sql = "INSERT INTO vendors (vendor_name)
           VALUES ($1)
           RETURNING *"
    values = [@vendor_name]
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

  def update()
    sql = "UPDATE vendors
           SET (vendor_name) = ($1)
           WHERE id = $2"
    values = [@vendor_name, @id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM vendors"
    values = []
    SqlRunner.run(sql, values)
  end

end
