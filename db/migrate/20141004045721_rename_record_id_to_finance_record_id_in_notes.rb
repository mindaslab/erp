class RenameRecordIdToFinanceRecordIdInNotes < ActiveRecord::Migration
  def change
    rename_column :notes, :record_id, :finance_record_id
  end
end
