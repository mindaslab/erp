class CreateCompaniesUsersTable < ActiveRecord::Migration
  def change
    create_table(:companies_users, id: false) do |t|
      t.integer :company_id
      t.integer :user_id
    end
  end
end
