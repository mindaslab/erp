class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.decimal :amount
      t.text :description
      t.references :book, index: true
      t.integer :status

      t.timestamps
    end
  end
end
