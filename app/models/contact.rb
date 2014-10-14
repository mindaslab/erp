class Contact < ActiveRecord::Base
  belongs_to :company
  has_many :finance_records
  validates :name, presence: true

  SearchableColumns = [:name, :ph, :email, :address,
  :city, :zip, :country ]
  include Searchable
end
