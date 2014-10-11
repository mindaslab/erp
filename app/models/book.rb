class Book < ActiveRecord::Base
  belongs_to :company
  has_many :finance_records, dependent: :destroy
  validates :name, presence: true

  SearchableColumns = [:name, :description]
  include Searchable

  def revenue
    finace_records.revenue.sum(:amount)
  end

  def expense
    finace_records.expense.sum(:amount)
  end

  def pending_revenue
    finace_records.pending_revenue.sum(:amount)
  end

  def pending_expense
    finace_records.pending_expense.sum(:amount)
  end

  def income
    revenue - expense
  end
end
