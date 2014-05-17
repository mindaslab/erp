class Record < ActiveRecord::Base
  enum status: [:income, :expense, :pending_income, :pending_expense]
  belongs_to :book
end
