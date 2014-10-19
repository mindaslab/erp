class FinanceRecord < ActiveRecord::Base
  enum status: [:revenue, :expense, :pending_revenue, :pending_expense,
    :capital, :draw, :loan_taken]

  CSV_COLUMNS = %w(sno time transaction description amount)
  belongs_to :book
  belongs_to :contact
  has_many :docs
  has_many :notes
  before_create :assign_sno

  SearchableColumns = [:description]
  include Searchable

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << FinanceRecord::CSV_COLUMNS.collect{|column_name| column_name.capitalize}
      all.each do |record|
        row = []
        for column in FinanceRecord::CSV_COLUMNS
          row << record.send(column)
        end
        csv << row
      end
    end
  end

  def transaction
    self.status
  end

  private
  def assign_sno
    self.sno = self.book.finance_records.maximum(:sno).to_i + 1
  end
end
