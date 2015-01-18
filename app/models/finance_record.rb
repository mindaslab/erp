class FinanceRecord < ActiveRecord::Base
  enum status: [:revenue, :expense, :pending_revenue, :pending_expense,
    :capital, :draw, :loan_taken, :asset]

  CSV_COLUMNS = %w(sno time transaction description amount)
  belongs_to :book
  belongs_to :contact
  has_many :docs
  has_many :notes
  before_create :assign_sno
  belongs_to :whodidit, class_name: "User", foreign_key: :whodunnit_id

  validates :amount, presence: true, numericality: true
  validate :amount_cant_be_negative

  has_paper_trail # as dictated by paper_trail gem

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
    self.status.gsub(/_/, " ").capitalize
  end

  ##
  # Returns all versions of this finance record
  def history
    finance_records = []
    for version in self.versions.reverse
      finance_records << self.version_at(version.created_at)
    end
    finance_records
  end

  private
  def assign_sno
    self.sno = self.book.finance_records.maximum(:sno).to_i + 1
  end

  def amount_cant_be_negative
    errors.add(:amount, " should be greater than zero") if amount.present? and amount < 0
  end
end
