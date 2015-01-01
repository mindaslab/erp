class Note < ActiveRecord::Base
  belongs_to :finance_record
  validates :content, presence: true
  include FinanceRecordComponents
end
