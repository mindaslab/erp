class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.references :company, index: true
      t.string :name
      t.string :ph
      t.string :email
      t.string :address
      t.string :city
      t.string :zip
      t.string :country
      t.boolean :business
      t.boolean :customer
      t.boolean :supplier
      t.boolean :employee

      t.timestamps
    end
  end
end
