
class Budget

  attr_accessor :budget

  def initialize()
    @budget = 0
  end

  def self.set_budget(number)
    return @budget += number
  end


end

#Create table with one row.
