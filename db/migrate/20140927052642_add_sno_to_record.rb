class AddSnoToRecord < ActiveRecord::Migration
  def change
    add_column :records, :sno, :integer, default: 0
  end
end
