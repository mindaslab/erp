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

  ##
  # Performs complex search depending on the paraams passed
  def self.complex_search records, params
    records = records.search(params[:s]) unless params[:s].empty? if params[:s]
    records = records.send(params[:t]) if FinanceRecord.statuses.keys.index(params[:t])
    records = records.where("time >= ?", date_to_db_string(params[:st], "beginning")) if params[:st].present?
    records = records.where("time <= ?", date_to_db_string(params[:et], "end")) if params[:et].present?
    records
  end
end
