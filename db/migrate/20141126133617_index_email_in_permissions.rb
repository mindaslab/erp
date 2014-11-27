class IndexEmailInPermissions < ActiveRecord::Migration
  def change
    add_index :permits, :email
  end
end
