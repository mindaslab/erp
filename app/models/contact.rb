class Contact < ActiveRecord::Base
  belongs_to :company
  has_many :finance_records, dependent: :destroy
  has_many :books, through: :finance_records
  validates :name, presence: true
  before_create :assign_sno

  SearchableColumns = [:name, :ph, :email, :address,
  :city, :zip, :country ]
  include Searchable

  private
  def assign_sno
    self.sno = self.company.contacts.maximum(:sno).to_i + 1
  end
end
