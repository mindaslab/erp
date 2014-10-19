class FinanceRecord < ActiveRecord::Base
  enum status: [:revenue, :expense, :pending_revenue, :pending_expense,
    :capital, :draw, :loan_taken]
  belongs_to :book
  belongs_to :contact
  has_many :docs
  has_many :notes
  before_create :assign_sno

  SearchableColumns = [:description]
  include Searchable

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |product|
        csv << product.attributes.values_at(*column_names)
      end
    end
  end

  private
  def assign_sno
    self.sno = self.book.finance_records.maximum(:sno).to_i + 1
  end
end
