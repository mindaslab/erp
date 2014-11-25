class CreatePermits < ActiveRecord::Migration
  def change
    create_table :permits do |t|
      t.string :email

      t.timestamps
    end
  end
end
