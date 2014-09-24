class CreateCollabs < ActiveRecord::Migration
  def change
    create_table :collabs do |t|
      t.string :email
      t.references :company, index: true

      t.timestamps
    end
  end
end
