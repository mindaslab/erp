class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :name
      t.text :description
      t.references :company, index: true

      t.timestamps
    end
  end
end
