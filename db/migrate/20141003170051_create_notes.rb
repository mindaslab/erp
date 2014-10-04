class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.text :content
      t.references :record, index: true

      t.timestamps
    end
  end
end
