class Book < ActiveRecord::Base
  belongs_to :company
  has_many :records, dependent: :destroy
  validates :name, presence: true
  SearchableColumns = [:name, :description]
  
  include Searchable
  
  def income
    records.income.sum(:amount)
  end
  
  def expense
    records.expense.sum(:amount)
  end
  
  def pending_income
    records.pending_income.sum(:amount)
  end
  
  def pending_expense
    records.pending_expense.sum(:amount)
  end
  
  def balance
    income - expense
  end
end
