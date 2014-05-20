class ChangeAddressTypeInContacts < ActiveRecord::Migration
  def self.up
    change_column :contacts, :address, :text
  end
  
  def self.down
    change_column :contacts, :address, :string
  end
end
