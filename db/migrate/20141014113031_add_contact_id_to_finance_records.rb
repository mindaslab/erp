class AddContactIdToFinanceRecords < ActiveRecord::Migration
  def change
    add_column  :finance_records, :contact_id, :integer
    add_index   :finance_records, :contact_id
  end
end
