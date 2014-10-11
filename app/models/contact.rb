class Contact < ActiveRecord::Base
  belongs_to :company
  validates :name, presence: true

  SearchableColumns = [:name, :ph, :email, :address,
  :city, :zip, :country ]
  include Searchable
end
