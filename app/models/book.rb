class Book < ActiveRecord::Base
  belongs_to :company
  has_many :records, dependent: :destroy
  validates :name, presence: true
  SearchableColumns = [:name, :description]
  
  include Searchable
  
  def revenue
    records.revenue.sum(:amount)
  end
  
  def expense
    records.expense.sum(:amount)
  end
  
  def pending_revenue
    records.pending_revenue.sum(:amount)
  end
  
  def pending_expense
    records.pending_expense.sum(:amount)
  end
  
  def income
    revenue - expense
  end
end
