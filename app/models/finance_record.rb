class FinanceRecord < ActiveRecord::Base
  enum status: [:revenue, :expense, :pending_revenue, :pending_expense,
    :capital, :draw, :loan_taken]
  belongs_to :book
  before_create :assign_sno

  SearchableColumns = [:description]
  include Searchable

  private
  def assign_sno
    self.sno = self.book.finance_records.maximum(:sno).to_i + 1
  end
end
