class AddSnoToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :sno, :integer, default: 0
  end
end
