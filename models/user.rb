require('pg')
require_relative('../db/sql_runner')

class Budget

  attr_accessor :budget

  def initialize(options)
    @budget = options['budget'].to_f
  end

end

#Create table with one row.
