class RenameRecordsToFinanceRecords < ActiveRecord::Migration
  def change
    rename_table :records, :finance_records
  end
end
