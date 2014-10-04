##
# Some cladsses like Doc and Note belongs_to
# FinanceRecord and have a common code, those
# codes are moved here
module FinanceRecordComponents
  extend ActiveSupport::Concern

  def book
    finance_record.book
  end

  def company
    book.company
  end
end
