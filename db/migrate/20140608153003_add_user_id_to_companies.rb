class AddUserIdToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :user_id, :integer
  end
end
