class Note < ActiveRecord::Base
  belongs_to :finance_record
  include FinanceRecordComponents
end
