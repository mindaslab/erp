class RenameRecordIdToFinanceRecordIdInDocs < ActiveRecord::Migration
  def change
    rename_column :docs, :record_id, :finance_record_id
  end
end
