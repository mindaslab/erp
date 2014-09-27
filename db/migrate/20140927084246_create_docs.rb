class CreateDocs < ActiveRecord::Migration
  def change
    create_table :docs do |t|
      t.references :record, index: true

      t.timestamps
    end
  end
end
