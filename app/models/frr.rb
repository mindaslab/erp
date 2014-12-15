##
# Finance record reducer
# Takes in buch of finance records ahnd reduces it
class Frr
  ##
  # Returns balance of a records
  def self.balance records
    self.income(records) + records.capital.sum(:amount) - records.draw.sum(:amount) +
    records.loan_taken.sum(:amount)
  end

  ##
  # Returns income got from records
  def self.income records
    revenue = records.revenue.sum(:amount)
    expense = records.expense.sum(:amount)
    revenue - expense
  end
end
