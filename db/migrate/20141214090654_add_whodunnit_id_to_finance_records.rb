class AddWhodunnitIdToFinanceRecords < ActiveRecord::Migration
  def change
    add_column :finance_records, :whodunnit_id, :integer
  end
end
